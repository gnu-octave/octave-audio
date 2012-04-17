// Author: Bruce T. Lowerre
// This program is granted to the public domain.

/*
 * ENDPOINT.CC - The endpoint class member routines.
 *
 * The endpointer is used to determine the start and end of a live
 * input signal.  Unlike a pre-recorded utterance, a live input signal
 * is open-ended in that the actual start and end of the signal is
 * totally unknown.  The search will usually do a fairly good job of
 * guessing the start of the signal.  However, the actual end of the
 * signal is unknown to the recognizer.  Reaching the end state in the
 * recognizer does not necessarily mean the end of signal.  Therefore,
 * the end of signal must be calculated by some means.  This is the
 * job of the end point detector.  This module is accessed via a class
 * structure.  It should be called for each frame of data to determine
 * what processing should be done.
 *
 * The endpointer uses "cheap" signal processing features (energy and
 * zero cross count) and is intended to run constantly on a host
 * processor without the need of a DSP or high speed processor.  When
 * the start of the utterance is detected, then the expensive search
 * can be called.
 *
 * The endpointer is designed to run with a real-time processing
 * search.  That means that the live input signal is processed in
 * real-time while it's being read.  Therefore, the start of signal
 * will occur (and the search will start) before the entire utterance
 * has been read.  The ramifications of this is that the endpointer
 * has to guess as to the possible start and end of utterance.  These
 * guesses, frame labels, are used by other modules to guide the
 * utterance capture and search.  The endpointer may realize that it
 * has mis-labeled either the start of utterance or the end of
 * utterance.  When this happens, a special frame label (either
 * EP_RESET if a false start was detected or EP_NOTEND if a false end
 * was detected) is returned.
 *
 * The algorithms used in this module have evolved from 20 years of
 * work with live input signals.  */


#include <iostream>
#include <cmath>
#include "endpoint.h"
using namespace std;


/* ENDPOINTER::ENDPOINTER - class constructor, set initial values */
endpointer::endpointer
(
    long	d_samprate,		// sampling rate in Hz
    long	d_windowsize,		// windowsize in samples
    long	d_stepsize,		// step size in samples
    long	d_maxipause,		// default ending silence in msec
    long	d_minuttlng,		// default minuttlng in msec
    long	d_zcthresh,		// default zcthresh, Hz
    float	d_begfact,		// default begfact
    float	d_endfact,		// default endfact
    float	d_energyfact,		// default energyfact
    float	d_minstartsilence,	// default minstartsilence
    float	d_triggerfact,		// default triggerfact
    long	d_numdpnoise,		// default numdpnoise
    long	d_minfriclng,		// default minfriclng in msec
    long	d_maxpause,		// default maxpause in msec
    long	d_startblip,		// default startblip in msec
    long	d_endblip,		// default endblip in msec
    long	d_minvoicelng,		// default minvoicelng in msec
    long	d_minrise		// default minrise in msec
)
{
    long	i;

    samprate = d_samprate;
    windowsize = d_windowsize;
    stepsize = d_stepsize;
    maxipause = (d_maxipause * samprate) / (1000 * stepsize); // num steps
    minuttlng = (d_minuttlng * samprate) / (1000 * stepsize); // num steps
    zcthresh = (d_zcthresh * stepsize) / samprate; // per frame
    begfact = d_begfact;
    endfact = d_endfact;
    energyfact = d_energyfact;
    minstartsilence = d_minstartsilence;
    numdpnoise = d_numdpnoise;
    triggerfact = d_triggerfact;
    minfriclng = (d_minfriclng * samprate) / (1000 * stepsize);   // num steps
    maxpause = (d_maxpause * samprate) / (1000 * stepsize);       // num steps
    startblip = (d_startblip * samprate) / (1000 * stepsize);     // num steps
    endblip = (d_endblip * samprate) / (1000 * stepsize);         // num steps
    minvoicelng = (d_minvoicelng * samprate) / (1000 * stepsize); // num steps
    minrise = (d_minrise * samprate) / (1000 * stepsize);         // num steps
    lastdpnoise = new float[numdpnoise];
    for (i = 0; i < numdpnoise; i++)
        lastdpnoise[i] = 0.0;
    initendpoint ();
} // end endpointer::endpointer


/* ENDPOINTER::~ENDPOINTER - class destructor */
endpointer::~endpointer ()
{
    delete []lastdpnoise;
} // end endpointer::~endpointer


/* ENDPOINT::INITENDPOINT - initialize the endpoint variables */
void endpointer::initendpoint ()
{
    long	i;

    epstate = NOSILENCE;
    noise = 0.0;
    ave = 0.0;
    begthresh = 0.0;
    endthresh = begthresh;
    energy = 0.0;
    maxpeak = 0.0;
    scnt = 0;
    vcnt = 0;
    evcnt = 0;
    voicecount = 0;
    zccnt = 0;
    bscnt = 0;
    startframe = 0;
    endframe = 0;
    avescnt = 0;
    startsilenceok = false;
    ncount = 0;
    low = true;
    for (i = 0; i < numdpnoise; i++)
        lastdpnoise[i] = 0.0;
} // end endpointer::initendpoint


void endpointer::setnoise ()
{
    dpnoise = lastdpnoise[1] = lastdpnoise[0];
    ncount = 2;
} // end endpointer::setnoise


/* ENDPOINT::AVERAGENOISE - get average background noise level and
 * shift noise array */
void endpointer::averagenoise ()
{
    long	i;

    for (dpnoise = 0.0, i = ncount - 1; i > 0; i--)
    {
        dpnoise += lastdpnoise[i];
        lastdpnoise[i] = lastdpnoise[i - 1];
    }
    dpnoise = (dpnoise + lastdpnoise[0]) / ncount;
    if (ncount < numdpnoise)
        ncount ++;
} // end endpointer::averagenoise


/* ENDPOINT::ZCPEAKPICK - get the zero cross count and average energy */
void endpointer::zcpeakpick
(
    short	*samples			// raw samples
)
{
    long	i;
    float	sum,
		trigger;
    short	*smp;

    for (sum = 0.0, i = 0, smp = samples; i < windowsize; i++, smp++)
        sum += *smp * *smp;
    peakreturn = (sqrt (sum / windowsize));
    lastdpnoise[0] = peakreturn;

    if (ncount == 0)
        dpnoise = peakreturn;			// initial value
    trigger = dpnoise * triggerfact;		// schmidt trigger band

    for (i = 0, zc = 0, smp = samples; i < windowsize; i++, smp++)
    {
        if (low)
        {
            if (*smp > trigger)
            {					// up cross
                zc++;
                low = false;			// search for down cross
            }
        }
        else
        {
            if (*smp < -trigger)
            {					// down cross
                zc++;
                low = true;			// search for up cross
            }
        }
    }
} // end endpointer::zcpeakpick


/* ENDPOINT::GETENDPOINT - get the endpoint tag for the raw samples
 * The recognition system is designed to operate in real-time.  That
 * is, the search proceeds in parallel with input of the signal.  The
 * endpoint detection must, therefore, make a guess as to what the
 * current sample is and correct errors that may have been made
 * previously.  */
EPTAG endpointer::getendpoint
(
    short	*samples			// raw samples
)
{
    float	tmp;

    zcpeakpick (samples);			// get zc count and peak energy
    if (peakreturn > maxpeak)
    {
        maxpeak = peakreturn;
        if ((tmp = maxpeak / endfact) > endthresh)
            endthresh = tmp;
    }

    switch (epstate)
    {
        case NOSILENCE:				// start, get background silence
            ave += peakreturn;
            if (++scnt <= 3)
            {					// average 3 frame's worth
                if (scnt == 1)
                    setnoise ();
                else
                    averagenoise ();
                if (dpnoise < minstartsilence)
                {
                    startsilenceok = true;
                    ave += peakreturn;
                    avescnt++;
                }
                return (EP_SILENCE);
            }
            if (!startsilenceok)
            {
                epstate = START;
                return (EP_NOSTARTSILENCE);
            }
            ave /= avescnt;
            noise = ave;
            begthresh = noise + begfact;
            endthresh = begthresh;
            mnbe = noise * energyfact;
            epstate = INSILENCE;
            return (EP_SILENCE);

        case INSILENCE:
            ave = ((3.0 * ave) + peakreturn) / 4.0;
            if (peakreturn > begthresh || zc > zcthresh)
            {					// looks like start of signal
                energy += peakreturn - noise;
                if (zc > zcthresh)
                    zccnt++;
                if (peakreturn > begthresh)
                    voicecount++;
                if (++vcnt > minrise)
                {
                    scnt = 0;
                    epstate = START;		// definitely start of signal
                }
                return (EP_SIGNAL);
            }
            else
            {					// still in silence
                energy = 0.0;
                if (ave < noise)
                {
                    noise = ave;
                    begthresh = noise + begfact;
                    endthresh = begthresh;
                    mnbe = noise * energyfact;
                }
                if (vcnt > 0)
                {			// previous frame was signal
                    if (++bscnt > startblip || zccnt == vcnt)
                    {			// Oops, no longer in the signal
                        noise = ave;
                        begthresh = noise * begfact;
                        endthresh = begthresh;
                        mnbe = noise * energyfact;
                        vcnt = 0;
                        zccnt = 0;
                        bscnt = 0;
                        voicecount = 0;
                        startframe = 0;
                        return (EP_RESET);// not in the signal, ignore previous
                    }
                    return (EP_SIGNAL);
                }
                zccnt = 0;
                return (EP_SILENCE);
            }

         case START:
             if (peakreturn > begthresh || zc > zcthresh)
             {				// possible start of signal
                 energy += peakreturn - noise;
                 if (zc > zcthresh)
                     zccnt++;
                 if (peakreturn > begthresh)
                     voicecount++;
                 vcnt += scnt + 1;
                 scnt = 0;
                 if (energy > mnbe || zccnt > minfriclng)
                 {
                     epstate = INSIGNAL;
                     return (EP_INUTT);
                 }
                 else 
                     return (EP_SIGNAL);
             }
             else
             if (++scnt > maxpause)
             {				// signal went low again, false start
                 vcnt = zccnt = voicecount = 0;
                 energy = 0.0;
                 epstate = INSILENCE;
                 ave = ((3.0 * ave) + peakreturn) / 4.0;
                 if (ave < noise + begfact)
                 {			// lower noise level
                     noise = ave;
                     begthresh = noise + begfact;
                     endthresh = begthresh;
                     mnbe = noise * energyfact;
                 }
                 return (EP_RESET);
             }
             else 
	       return (EP_SIGNAL);

        case INSIGNAL:
            if (peakreturn > endthresh || zc > zcthresh)
            {				// still in signal
                if (peakreturn > endthresh)
                    voicecount++;
                vcnt++;
                scnt = 0;
                return (EP_SIGNAL);
            }
            else
            {				// below end threshold, may be end
                scnt++;
                epstate = END;
                return (EP_MAYBEEND);
            }

        case END:
            if (peakreturn > endthresh || zc > zcthresh)
            {				// signal went up again, may not be end
                if (peakreturn > endthresh)
                    voicecount++;
                if (++evcnt > endblip)
                {			// back in signal again
                    vcnt += scnt + 1;
                    evcnt = 0;
                    scnt = 0;
                    epstate = INSIGNAL;
                    return (EP_NOTEND);
                }
                else 
		  return (EP_SIGNAL);
            }
            else
            if (++scnt > maxipause)
            {				// silence exceeds inter-word pause
                if (vcnt > minuttlng && voicecount > minvoicelng)
                    return (EP_ENDOFUTT);// end of utterance
                else
                {			// signal is too short
                    scnt = vcnt = voicecount = 0;
                    epstate = INSILENCE;
                    return (EP_RESET);	// false utterance, keep looking
                }
            }
            else
            {				// may be an inter-word pause
                if (peakreturn == 0)
                    return (EP_ENDOFUTT);// zero filler frame
                evcnt = 0;
                return (EP_SIGNAL);	// assume still in signal
            }
    }
} // end endpointer::getendpoint


/* ENDPOINT::PRINTVARS: Print variable values */
void endpointer::printvars ()
{
    cout << "endpoint variables:" << endl;
    cout << "    begfact         " << begfact << endl;
    cout << "    endblip         " << endblip << endl;
    cout << "    endfact         " << endfact << endl;
    cout << "    energyfact      " << energyfact << endl;
    cout << "    maxipause       " << maxipause << endl;
    cout << "    maxpause        " << maxpause << endl;
    cout << "    minfriclng      " << minfriclng << endl;
    cout << "    minrise         " << minrise << endl;
    cout << "    minstartsilence " << minstartsilence << endl;
    cout << "    minuttlng       " << minuttlng << endl;
    cout << "    minvoicelng     " << minvoicelng << endl;
    cout << "    numdpnoise      " << numdpnoise << endl;
    cout << "    samprate        " << samprate << endl;
    cout << "    startblip       " << startblip << endl;
    cout << "    stepsize        " << stepsize << endl;
    cout << "    triggerfact     " << triggerfact << endl;
    cout << "    windowsize      " << windowsize << endl;
    cout << "    zcthresh        " << zcthresh << endl;
} // end endpointer::printvars


/* ENDPOINT::GETTAGNAME - convert the tag to ascii */
const char *endpointer::gettagname
(
    EPTAG	tag
)
{
    static const char *tagnames[] =	// must match EPTAG enum in endpoint.h
		{
			"NONE",
			"RESET",
			"SILENCE",
			"SIGNAL",
			"INUTT",
			"MAYBEEND",
			"ENDOFUTT",
			"NOTEND",
			"NOSTARTSILENCE"
		};
    long	ntag = long (tag);

    if (ntag < 0 || ntag > long (EP_NOSTARTSILENCE))
        return ("UNKNOWN");
    else
        return (tagnames[ntag]);
} // end endpointer::gettagname

