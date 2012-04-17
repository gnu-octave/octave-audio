// Author: Bruce T. Lowerre
// This program is granted to the public domain.

/*
 * ENDPOINT.H - endpoint class definition
 *
 * The endpointer is used to determine the start and end of a live
 * input signal.  Unlike a pre-recorded utterance, a live input signal
 * is open-ended in that the actual start and end of the signal is
 * totally unknown.  The search, using HMM techniques with a silence
 * model, will usually do a fairly good job of guessing the start of
 * the signal.  However, the actual end of the signal is unknown to
 * the recognizer.  Reaching the end state in the recognizer does not
 * necessarily mean the end of signal.  Therefore, the end of signal
 * must be calculated by some means.  This is the job of the end point
 * detector.  */

#ifndef ENDPOINT_H
#define ENDPOINT_H

//#include <general.h>				// contains general defs

typedef enum
{
    NOSILENCE,
    INSILENCE,
    START,
    INSIGNAL,
    END
} EPSTATE;

typedef enum
{
    EP_NONE,
    EP_RESET,
    EP_SILENCE,
    EP_SIGNAL,
    EP_INUTT,
    EP_MAYBEEND,
    EP_ENDOFUTT,
    EP_NOTEND,
    EP_NOSTARTSILENCE
} EPTAG;

class endpointer
{
    private:
        EPSTATE		epstate;
        float		ave,
			noise,
			begthresh,
			energy,
			maxpeak,
			endthresh,
			begfact,
			endfact,
			energyfact,
			mnbe,
			peakreturn,	// average energy
			dpnoise,
			triggerfact,	// schmidt trigger percent
			minstartsilence,
			*lastdpnoise;	// array of size numdpnoise
        long		samprate,	// sampling rate in Hz
			windowsize,	// window size in samples
			stepsize,	// step size in samples
        		scnt,
			avescnt,
			vcnt,
			evcnt,
			voicecount,
			minfriclng,
			bscnt,
			zccnt,
			startframe,
			endframe,
			ncount,
			zcthresh,
			numdpnoise,
			minrise,
			maxpause,
			maxipause,
			startblip,
			endblip,
			minuttlng,
			minvoicelng,
			zc;		// zero cross count per window
        bool		startsilenceok,
			low;		// is signal currently low or high?
        void zcpeakpick			// get zc count and average energy
        (
            short*			// raw samples
        );
        void setnoise ();		// initial noise level set
        void averagenoise ();		// average noise array and shift
    public:
        endpointer			// constructor
        (
            long,			// sampling rate in Hz
            long,			// window  size in samples
            long,			// step size in samples
            long = 700,			// endof utt silence default, msec
            long = 100,			// minuttlng default, msec
            long = 600,			// zcthresh default, Hz
            float = 40.0,		// begfact default
            float = 80.0,		// endfact default
            float = 200.0,		// energyfact default
            float = 2000.0,		// minstartsilence default
            float = 3.0,		// triggerfact default
            long = 6,			// numdpnoise default
            long = 50,			// minfriclng default, msec
            long = 150,			// maxpause default, msec
            long = 30,			// startblip default, msec
            long = 20,			// endblip default, msec
            long = 60,			// minvoicelng default, msec
            long = 50			// minrise default, msec
        );
        ~endpointer ();			// destructor

        void initendpoint ();		// initialize variables
        EPTAG getendpoint
        (
            short*			// raw samples of window size
        );
        const char *gettagname		// convert tag to ascii
        (
            EPTAG
        );
        void printvars ();		// print variables
        long getzc () {return (zc);}	// get the zero cross count
        float getenergy () {return (peakreturn);}	// get the RMS energy
}; // end class endpointer


#endif
