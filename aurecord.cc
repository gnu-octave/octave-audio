/*
 * HISTORY:
 *    May, 1999 - separate audio open/close from wave play
 *    Feb. 1999 - first public release.
 *
 * Copyright 1999 Paul Kienzle, <pkienzle@cs.indiana.edu>
 * This source code is freely redistributable and may be used for
 * any purpose.  This copyright notice must be maintained. 
 * Paul Kienzle is not responsible for the consequences of using
 * this software.
## TODO: Support SGI, Sun and Windows devices
## TODO: Clean up user interaction, possibly adding GUI support
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <signal.h>
#include "endpoint.h" 

/* ==================================================================== */
/* Input conversion routines (audio file -> machine representation) */

/* Read a 2 byte signed integer in little endian (Intel) format */
static int from_S16_LE(char *buf, short *sample)
{
#if __BYTE_ORDER == __BIG_ENDIAN
  {
    char t;
    t = buf[0]; buf[0] = buf[1]; buf[1] = t;
  }
#endif
  *sample = *(short *)buf;
  return 2;
}

/* Read a 2 byte signed integer in big endian (non-Intel) format */
static int from_S16_BE(char *buf, short *sample)
{
#if __BYTE_ORDER == __LITTLE_ENDIAN
  {
    char t;
    t = buf[0]; buf[0] = buf[1]; buf[1] = t;
  }
#endif
  *sample = *(short *)buf;
  return 2;
}


/* Read a 2 byte unsigned integer in little endian (Intel) format */
static int from_U16_LE(char *buf, short *sample)
{
#if __BYTE_ORDER == __BIG_ENDIAN
  {
    char t;
    t = buf[0]; buf[0] = buf[1]; buf[1] = t;
  }
#endif
  *sample = (short)((long)(*(unsigned short *)buf) - 32768);
  return 2;
}

/* Read a 2 byte unsigned integer in big endian (non-Intel) format */
static int from_U16_BE(char *buf, short *sample)
{
#if __BYTE_ORDER == __LITTLE_ENDIAN
  {
    char t;
    t = buf[0]; buf[0] = buf[1]; buf[1] = t;
  }
#endif
  *sample = (short)((long)(*(unsigned short *)buf) - 32768);
  return 2;
}

/* Read a 1 byte aLaw compressed value and convert to 2 byte signed integer */
static int from_A_LAW(char *buf, short *sample)
{
  static short alaw[] = {
    -5504,  -5248,  -6016,  -5760,  -4480,  -4224,  -4992,  -4736,
    -7552,  -7296,  -8064,  -7808,  -6528,  -6272,  -7040,  -6784,
    -2752,  -2624,  -3008,  -2880,  -2240,  -2112,  -2496,  -2368,
    -3776,  -3648,  -4032,  -3904,  -3264,  -3136,  -3520,  -3392,
    -22016, -20992, -24064, -23040, -17920, -16896, -19968, -18944,
    -30208, -29184, -32256, -31232, -26112, -25088, -28160, -27136,
    -11008, -10496, -12032, -11520,  -8960,  -8448,  -9984,  -9472,
    -15104, -14592, -16128, -15616, -13056, -12544, -14080, -13568,
    -344,   -328,   -376,   -360,   -280,   -264,   -312,   -296,
    -472,   -456,   -504,   -488,   -408,   -392,   -440,   -424,
    -88,    -72,   -120,   -104,    -24,     -8,    -56,    -40,
    -216,   -200,   -248,   -232,   -152,   -136,   -184,   -168,
    -1376,  -1312,  -1504,  -1440,  -1120,  -1056,  -1248,  -1184,
    -1888,  -1824,  -2016,  -1952,  -1632,  -1568,  -1760,  -1696,
    -688,   -656,   -752,   -720,   -560,   -528,   -624,   -592,
    -944,   -912,  -1008,   -976,   -816,   -784,   -880,   -848 };
  unsigned char t;

  t = *(unsigned char *)buf;
  if (t>=128) *sample = -alaw[t&0x7F];
  else *sample = alaw[t&0x7F];
  return 1;
}

/* Read a 1 byte uLaw compressed value and convert to 2 byte signed integer */
static int from_MU_LAW(char *buf, short *sample)
{
  static short ulaw[] = {
    -32124, -31100, -30076, -29052, -28028, -27004, -25980, -24956,
    -23932, -22908, -21884, -20860, -19836, -18812, -17788, -16764,
    -15996, -15484, -14972, -14460, -13948, -13436, -12924, -12412,
    -11900, -11388, -10876, -10364,  -9852,  -9340,  -8828,  -8316,
    -7932,  -7676,  -7420,  -7164,  -6908,  -6652,  -6396,  -6140,
    -5884,  -5628,  -5372,  -5116,  -4860,  -4604,  -4348,  -4092,
    -3900,  -3772,  -3644,  -3516,  -3388,  -3260,  -3132,  -3004,
    -2876,  -2748,  -2620,  -2492,  -2364,  -2236,  -2108,  -1980,
    -1884,  -1820,  -1756,  -1692,  -1628,  -1564,  -1500,  -1436,
    -1372,  -1308,  -1244,  -1180,  -1116,  -1052,   -988,   -924,
    -876,   -844,   -812,   -780,   -748,   -716,   -684,   -652,
    -620,   -588,   -556,   -524,   -492,   -460,   -428,   -396,
    -372,   -356,   -340,   -324,   -308,   -292,   -276,   -260,
    -244,   -228,   -212,   -196,   -180,   -164,   -148,   -132,
    -120,   -112,   -104,    -96,    -88,    -80,    -72,    -64,
    -56,    -48,    -40,    -32,    -24,    -16,     -8,      0};
  unsigned char t;

  t = *(unsigned char *)buf;
  if (t>=128) *sample = -ulaw[t&0x7F];
  else *sample = ulaw[t&0x7F];
  return 1;
}

/* Read a 1 byte unsigned value and convert to 2 byte signed integer */
static int from_U8(char *buf, short *sample)
{
  unsigned char t;

  t = *(unsigned char *)buf;
  *sample = (t-128)<<8;
  return 1;
}

/* Read a 1 byte unsigned value and convert to 2 byte signed integer */
static int from_S8(char *buf, short *sample)
{
  unsigned char t;

  t = *(unsigned char *)buf;
  *sample = t<<8;
  return 1;
}

/* ===================================================================== */
/* Audio device routines */

/* Okay, now for the OS specific audio code:
 *
 * audioopen(int rate, int channels) returns true if the audio device
 * has been opened.  This routine must set the global variables
 * audiorate and audiochannels to the actual rate and channels
 * selected for the device which may be different from those
 * requested.  This routine must also set audioconvert, the function
 * which takes the machine representation for samples (2 byte signed
 * integers) and converts them to the audio format specified for the
 * audio device.
 *
 * audioplay(void *data, int length) returns true if data was played.
 * The data has already been converted to the correct rate, number of
 * channels and audio format for the device.  The length is the number
 * of BYTES to play (not the number of samples).
 *
 * audioclose() closes the audio device.  */

typedef int (*CONVERSION)(char *buf, short *sample);
static CONVERSION audioconvert;
static int audiorate;
static int audiochannels;

/* ==================================================================== */
#if 1  /* LINUX OSS audio drivers */
#include <linux/soundcard.h>

static int audio = -1;
int audioopen(int rate, int channels)
{
  int format, outformat, mask;

  /* Open audio device */
  audio = open("/dev/dsp", O_RDONLY);
  if (audio < 0) return -1;

  /* Set channels (mono vs. stereo) and remember what was set */
  --channels;
  if (ioctl(audio, SNDCTL_DSP_STEREO, &channels) < 0) goto error;
  audiochannels = channels+1;

  /* Set input format. Convert to a format which preserves the most
   * bits if the selected format is unavailable.
   */
#if __BYTE_ORDER == __LITTLE_ENDIAN
  outformat = format = AFMT_S16_LE, audioconvert=from_S16_LE;
#else
  outformat = format = AFMT_S16_BE, audioconvert=from_S16_BE;
#endif
  if (ioctl(audio, SNDCTL_DSP_SETFMT, &outformat) < 0) goto error;
  if (outformat != format) {
    if (ioctl(audio, SNDCTL_DSP_GETFMTS, &mask) < 0) goto error;
    if (mask&AFMT_S16_LE)      format = AFMT_S16_LE, audioconvert=from_S16_LE;
    else if (mask&AFMT_S16_BE) format = AFMT_S16_BE, audioconvert=from_S16_BE;
    else if (mask&AFMT_U16_LE) format = AFMT_U16_LE, audioconvert=from_U16_LE;
    else if (mask&AFMT_U16_BE) format = AFMT_U16_BE, audioconvert=from_U16_BE;
    else if (mask&AFMT_MU_LAW) format = AFMT_MU_LAW, audioconvert=from_MU_LAW;
    else if (mask&AFMT_A_LAW)  format = AFMT_A_LAW,  audioconvert=from_A_LAW;
    else if (mask&AFMT_U8)     format = AFMT_U8,     audioconvert=from_U8;
    else if (mask&AFMT_S8)     format = AFMT_S8,     audioconvert=from_S8;
    else goto error;
    if (ioctl(audio, SNDCTL_DSP_SETFMT, &format) < 0) goto error;
  }

  /* Set sample rate and remember what was set. */
  if (ioctl(audio, SNDCTL_DSP_SPEED, &rate) < 0) goto error;
  audiorate = rate;
  return 1;

error:
  close(audio);
  return 0;
}

static short audiosample()
{
  static char buf[2048];
  static int bufpos = sizeof(buf);
  int len;
  short sample;

  if (bufpos >= sizeof(buf)) {
    len = read(audio, buf, sizeof(buf));
    while (len < sizeof(buf)) buf[len++] = 0;
    bufpos = 0;
  }
  bufpos += (*audioconvert)(buf+bufpos, &sample);
  return sample;
}

void audioclose()
{
  close(audio);
  audio = -1;
}

void audioabort() 
{
  if (audio != -1) {
    ioctl(audio, SNDCTL_DSP_RESET, NULL);
    audioclose();
  }
}
#endif



#if 0
// This is an attempt at showing the capture interaction in an X window,
// programmed in raw Xlib.  It doesn't work yet.  Instead, the interaction
// is done on stderr.  Too bad *Inferior Octave* doesn't handle ^M properly.

#include <X11/X.h>
#include <X11/Xlib.h>

void inform(char str[])
{
  static int first = 1;
  static Display *display = NULL;
  static int screen;
  static Window window;
  static GC gc;
  static XFontStruct *fontstruct;
  static Font font; 

  if (display == NULL && !first) return;
  if (first) {
    XGCValues gcvalues;

    first = 0;
    if (str == NULL) return;
    display = XOpenDisplay(NULL);
    if (display == NULL) return;
    screen = DefaultScreen(display);
    gc = XDefaultGC(display,screen);
    XGetGCValues(display, gc, GCFont, &gcvalues);
    //    font = gcvalues.font;
    //    fontstruct = XQueryFont(display, font);
    window = XCreateWindow(display, XDefaultRootWindow(display),
			   0,0,640,20,2,
			   CopyFromParent, InputOutput, CopyFromParent, 
			   0, NULL);
    XStoreName(display, window, "Audio Capture");
    XMapWindow(display, window);
  }

  if (str == NULL) {
    XDestroyWindow(display, window);
    XCloseDisplay(display);
  }
  else {
    XTextItem txt;

    XClearArea(display, window, 0, 0, 640, 20, 1);
    txt.chars = str;
    txt.nchars = strlen(str);
    txt.delta = 1;
    txt.font = None;
    //    XDrawText(display, window, gc, 0, 20-fontstruct->descent, &txt, 1);
  }
}
#else
void inform(char *str)
{
  if (str != NULL) {
#if 0
    fprintf(stderr, "\r%-38s", str);
#else
    fprintf(stderr, "%s\n", str);
#endif
  }
  else
    fprintf(stderr, "\n");
}
#endif

int capture(int rate, short *capturebuf, int capturelen)
{
  // Note: initial silence is WINDOW+2*STEP
  const float STEP=0.010;	        // step size in sec
  const float WINDOW=0.016;	// window size in sec
  const long ENDSILENCE=700;      // duration of end silence in msec 
  const long MINLENGTH=300;       // minimum utterance in msec
  
  endpointer *ep;
  int framelen, framestep;
  short *frame;
  int framenumber=0; /* Currently active frame number */
  int framepos = 0;
  int capturepos, captureend, remaining;
  EPTAG tag, state=EP_RESET;

  /* initialize capture */
  framelen = (int)(WINDOW*(float)rate);
  framestep = (int)(STEP*(float)rate);
  frame = new short[framelen];
  ep = new endpointer(rate, framestep, framelen, ENDSILENCE, MINLENGTH);

  while (1) {
    /* Fill the next frame */
    while (framepos < framelen) frame[framepos++] = audiosample();
    framenumber++;

    /* Process frame through the end point detector */
    tag = ep -> getendpoint (frame);// get endpoint tag
#if 0
    fprintf(stderr, "     tag=%s, state=%s\n", 
	    ep->gettagname(tag), ep->gettagname(state));
#endif
    switch (tag) {	// determine what to do with this frame
    case EP_NOSTARTSILENCE:	// error condition --- restart process
      if (tag == EP_NOSTARTSILENCE)
	inform("Spoke too soon. Wait a bit and try again...");
      ep->initendpoint();
      framenumber = 0;
      // fall through to RESET
      
    case EP_RESET:		// false start --- restart recognizer
      // fall through to SILENCE
      
    case EP_SILENCE:		// not yet start of utterance
      if (state != EP_SILENCE && framenumber > 3) {
	inform("Waiting for you to speak...");
	state = EP_SILENCE;
      }
      capturepos = 0;
      break;
      
    case EP_MAYBEEND:		// possible end of utterance
      if (tag == EP_MAYBEEND) captureend = capturepos;
      // fall through to SIGNAL
      
      
    case EP_NOTEND:		// the last MAYBEEND was NOT the end 
      if (tag == EP_NOTEND) captureend = 0;
      // fall through to SIGNAL
      
    case EP_INUTT:		// confirmed signal start
      // all data frames before this marked as EP_SIGNAL were part
      // of the actual utterance.  A reset after this point will be
      // due to a rejected signal rather than a false start.
      if (state != EP_INUTT) {
	inform("Capturing your speech...");
	state = EP_INUTT;
      }
      // fall through to SIGNAL
      
    case EP_SIGNAL:		// signal frame
      // Copy frame into capture buf.
      remaining = capturelen - capturepos;
      if (remaining > framestep) remaining = framestep;
      if (remaining > 0) 
	memcpy(capturebuf+capturepos, frame, remaining*sizeof(*frame));
      capturepos += remaining;
      
      // Check for end of capture buf.
      if (capturepos == capturelen) {
	if (captureend == 0) captureend = capturepos;
	inform("Speech exceeded capture duration. Use -t to increase.");
	inform(NULL);
	return captureend;
      }
      break;
      
    case EP_ENDOFUTT:		// confirmed end of utterance
      // This is a silence frame after the end of signal.  The previous
      // MAYBEEND frame was the actual end of utterance
      inform(NULL);
      return captureend;
    }

    /* Shift the frame overlap to the start of the frame. */
    framepos = framelen - framestep;
    memmove(frame, frame+framestep, framepos*sizeof(*frame));
  }

  return 0;
}


void cleanup(int sig)
{
  audioabort();
  exit(2);
}

int main(int argc, char *argv[]) 
{
   int do_endpoint = 0;
   int rate=16000, channels=1;
   double time=1;
   short *buf;
   int i, c, samples;


   /* Interpret options */
   do {
     c = getopt(argc, argv, "et:r:c:?");
     switch (c) {
     case 'e': do_endpoint = 1; break;
     case 'r': rate = atoi(optarg); break;
     case 'c': channels = atoi(optarg); break;
     case 't': time = atof(optarg); break;
     case '?': 
       fprintf (stderr, "usage: aurecord [-t time] [-r rate] [-c channels]\n");
       exit(1);
     }
   } while (c != EOF);
  
   /* Prepare for interrupt. */
   signal(SIGINT, cleanup);

   /* open audio device and skip the first bunch of samples */
   if (audioopen(rate, channels) < 0) return 1;
   for (i = 0; i < 1024; i++) audiosample();

   fwrite(&audiorate, 4, 1, stdout);
   fwrite(&audiochannels, 4, 1, stdout);
   samples = (long)((double)audiorate * time)*audiochannels;
   buf = new short[samples];

   if (do_endpoint) {
     /* wait for audio event before grabbing samples */
     samples = capture(audiorate, buf, samples);
   }
   else {
     /* grab all the samples you need directly */
     for (i = 0; i < samples; i++) buf[i] = audiosample();
   }

   /* close the audio device */
   audioclose();

   /* output the captured samples */
   fwrite(buf, 2, samples, stdout);
   return 0;
}
