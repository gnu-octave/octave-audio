## Copyright (C) 2024 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{phon} =} sone2phon (@var{sone})
## @deftypefnx {} {@var{phon} =} sone2phon (@var{sone}, @var{standard})
## Convert from sone to phon.
##
## @subsubheading Inputs
## @var{sone} - Loudness level in sone
##
## @var{standard} - Standard to use in conversion. Options are
## 'ISO 532-1' or 'ISO 532-2'.
##
## 'ISO 532-1' is used if no standard is provided.
##
## @subsubheading Outputs
## @var{sone} - Loudness level in sone
##
## @subsubheading Examples
## Convert 100 sone to phon
## @example
## @code{sone = sone2phon(100)}
## @end example
##
## @subsubheading References
## International Organization for Standardization., @cite{ISO 532-1 Acoustics – Methods for calculating loudness – Part 1: Zwicker method.}
##
## International Organization for Standardization., @cite{ISO 532-2 Acoustics – Methods for calculating loudness – Part 2: Moore-Glasberg method.}
##
## https://sengpielaudio.com/calculatorSonephon.htm
##
## @seealso {sone2phon}
## @end deftypefn

function phon = sone2phon(sone, standard='ISO 532-1')
  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(sone) && isreal(sone))
    error ("Expected sone as a real scalar or vector");
  endif

  if ! ischar(standard)
    error ("Expected standard as a string");
  endif

  standard = lower(standard);

  if standard != 'iso 532-1' && standard != 'iso 532-2'
    error ("Uknown standard specified - expected 'iso 532-1' or 'iso 532-2'");
  endif

  if standard == 'iso 532-1'
    idx1 = find(sone<1);
    idx2 = find(sone>=1);
    phon(idx1) = 40 * (sone(idx1) .^ 0.35);
    phon(idx2) = 40 + (10 * log2(sone(idx2)));
  else
    lookup_tbl = [
      0.0	0.001;
      2.2	0.004;
      4.0	0.008;
      5.0	0.010;
      7.5	0.019;
      10.0	0.031;
      15.0	0.073;
      20.0	0.146;
      25.0	0.26;
      30.0	0.43;
      35.0	0.67;
      40.0	1.00;
      45.0	1.46;
      50.0	2.09;
      55.0	2.96;
      60.0	4.14;
      65.0	5.77;
      70.0	8.04;
      75.0	11.2;
      80.0	15.8;
      85.0	22.7;
      90.0	32.9;
      95.0	47.7;
      100.0	69.6;
      105.0	102.0;
      110.0	151.0;
      115.0	225.0;
      120.0	337.6;
    ];

    idx1 = find(sone<0.001);
    idx2 = find(sone>0.001 & sone<337.6);
    idx3 = find(sone>=337.6);

    phon(idx1) = 0.0;
    phon(idx2) = interp1(lookup_tbl(:,2), lookup_tbl(:,1), sone(idx2), 'linear');
    phon(idx3) = 120.0;
  endif
endfunction

%!error sone2phon()
%!error sone2phon('a')
%!error sone2phon([100], 'invalid')

%!assert(sone2phon(16), 80, 100*eps)
%!assert(sone2phon(16, 'ISO 532-1'), 80, 100*eps)
%!assert(sone2phon(15.8, 'ISO 532-2'), 80, 100*eps)
