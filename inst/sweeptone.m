## Copyright (C) 2026 John Donoghue <john.donoghue@ieee.org>
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{excitation} =} sweeptone()
## @deftypefnx {} {@var{excitation} =} sweeptone(@var{swDur})
## @deftypefnx {} {@var{excitation} =} sweeptone(@var{swDur}, @var{siDur})
## @deftypefnx {} {@var{excitation} =} sweeptone(@var{swDur}, @var{siDur}, @var{fs})
## @deftypefnx {} {@var{excitation} =} sweeptone(___, @var{propname}, @var{propvalue} @dots{})
## Generate an excitation signal using the exponential swept sine (ESS) technique.
##
## By default, the signal has a 6-second duration, followed by 4 seconds of silence, for a
## sample rate of 44100 Hz.
##
## @subsubheading Inputs
## @var{swDur} - Positive scalar sweep duration (default 6)
##
## @var{siDur} - scalar silence durtation to follow the sweep (default 4)
##
## @var{fs} - Sample frequency. (default 44100)
##
### @var{propname}, @var{propvalue} - property name/value pairs.
##
## Known properties are:
## @table @asis
## @item ExcitationLevel
## Excitation Level scalar in the range of [-42, 0] (default -6)
## @item SweepFrequencyRange
## 2 element vector for sweep frequency range (default [10 22000]).
## Max value can be fs/2.
## @end table
##
## @subsubheading Outputs
## @var{excitation} - Output signal using ESS technique.
##
## @subsubheading Examples
##
## Create a sweep tone excitation signal by using the sweeptone function.
## sweep duration of 2 seconds, 1 second silence, sample frequency of 44100.
## Then plot it.
##
## @example
## excitation = sweeptone (2, 1, 44100);
## plot(excitation)
## @end example
##
## @subsubheading References
##
## [1] Farina, Angelo.
##  @cite{Advancements in Impulse Response Measurements by Sine Sweeps.}
## Presented at the Audio Engineering Society 122nd Convention, Vienna, Austria, 2007.
##
## @end deftypefn

function excitation = sweeptone(varargin)
  swDur = 6;
  siDur = 4;
  fs = 44100;
  excitationlevel = -6;
  sweepfrequencyrange = [];
  propstart = 1;

  # for the 1st 3 inputs, if they are scalar, assume its input of swdur, sidur and fs
  # otherwise its the start what should be properties 
  if nargin > 0 && isscalar(varargin{1})
    swDur = varargin{1};
    if swDur <= 0
      error ("Expected swDur as a > 0 scalar")
    endif
    propstart = 2;
    if nargin > 1 && isscalar(varargin{2})
      siDur = varargin{2};
      if siDur < 0
        error ("Expected siDur as a >= 0 scalar")
      endif
      propstart = 3;
      if nargin > 2 && isscalar(varargin{3})
        fs = varargin{3};
	if fs <= 0
          error ("Expected fs as a positive scalar")
	endif
        propstart = 4;
      endif
    endif
  endif

  # process any properties
  propargs = varargin(propstart:end);
  if !isempty(propargs)
    if mod(length(propargs), 2) != 0
      error ("expected property name, value pairs");
    endif
    if !iscellstr (propargs(1:2:length(propargs)))
      error ("fitsread: expected property names to be strings");
    endif

    for idx = 1:2:length(propargs)
      prop = lower(propargs{idx});
      val = propargs{idx+1};
      switch(prop)
        case "excitationlevel"
          if !isscalar(val)
            error ("Expected excitationlevel as a scalar between -4 and 0");
	  endif
	  excitationlevel = val;
        case "sweepfrequencyrange"
          if !isnumeric(val) || !isvector(val) || length(val) != 2
            error ("Expected sweepfrequencyrange as a 2 element vector");
          endif
	  sweepfrequencyrange = val;
        otherwise
          warning("Unknown property '%s' ignored", prop);
      endswitch
    endfor
  endif

  # no range set yet
  if isempty(sweepfrequencyrange)
    sweepfrequencyrange = [10 22000];
    if sweepfrequencyrange(2) > fs/2
      sweepfrequencyrange(2) = fs/2;
    endif
  endif

  # generate sweep section
  f1 = sweepfrequencyrange(1);
  f2 = sweepfrequencyrange(2);

  # Sweep duration samples
  N = round (swDur * fs);

  # Time vector
  t_sweep = (0:N - 1).' / fs;

  # ESS parameter
  L = swDur / log (f2 / f1);

  # ESS phase
  phase = 2 * pi * f1 * L ...
          * (exp (t_sweep / L) - 1);

  # Generate sweep
  sweep = sin (phase);

  # Apply excitation level
  gain = 10^(excitationlevel / 20);
  sweep *= gain;

  # Append silence
  Ns = round (siDur * fs);

  # Output signal is the sweep section followed by silence section
  excitation = [sweep; zeros(Ns, 1)];

endfunction

%!demo
%! # Create a sweep tone excitation signal by using the sweeptone function.
%! # sweep duration of 2 seconds, 1 second silence, sample frequency of 44100.
%! excitation = sweeptone(2,1,44100);
%! figure
%! plot(excitation)
%! title('Excitation')
%!
%! # Pass the excitation signal through an infinite impulse response (IIR) filter
%! # and add noise to model a real-world recording (system response).
%! # (using singal toolkit)
%! pkg load signal
%! [B,A] = butter(10,[.1 .7]);
%! rec = filter(B,A,excitation);
%! nrec = rec + 0.12*randn(size(rec));
%! figure
%! plot(nrec)
%! title('System Response')

%!error sweeptone("test")

%!test
%! excitation = sweeptone();
%! assert(size(excitation), [441000 1])
%!test
%! excitation = sweeptone(2);
%! assert(size(excitation), [264600 1])
%!test
%! excitation = sweeptone(2,1);
%! assert(size(excitation), [132300 1])
%!test
%! excitation = sweeptone(2,1, 1000);
%! assert(size(excitation), [3000 1])
%!test
%! excitation = sweeptone(2,1, 1000, 'ExcitationLevel', -20);
%! assert(size(excitation), [3000 1])
%!test
%! excitation = sweeptone(2,1, 1000, 'ExcitationLevel', -20, 'SweepFrequencyRange', [20, 500]);
%! assert(size(excitation), [3000 1])
