// Author: Per Persson <persquare@users.sf.net>
// This program is granted to the public domain.

/* ofsndplay
 * Based on code by Chuck Bennet <chuck@benatong.com>
 * and Matthew McCabe <mlm@escapement.net>
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface OFSoundPlayer:NSObject {
}
- (void)playFile:(NSString *)thePath;
- (void)playData:(NSData *)data;
- (void)sound:(NSSound *)sound didFinishPlaying:(BOOL)aBool;
@end

@implementation OFSoundPlayer
- (void)playFile:(NSString *)thePath
{
  NSSound *sound = [[NSSound alloc] initWithContentsOfFile:thePath byReference:YES];   
  [sound setDelegate: self];
  if([sound play] == YES) {
    [[NSRunLoop currentRunLoop] run];
  }
}

- (void)playData:(NSData *)data
{
  NSSound *sound = [[NSSound alloc] initWithData:data];
  [sound setDelegate: self];
  if([sound play] == YES) {
    [[NSRunLoop currentRunLoop] run];
  }
}

// According to the docs(?) the runloop should exit when the sound is
// finished.  It doesn't. Instead, use this delegate method to exit
// the process.
- (void)sound:(NSSound *)sound didFinishPlaying:(BOOL)aBool
{
  exit(0);
}
@end

int main (int argc, const char * argv[])
{   
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  
  NSMutableData *soundData = [NSMutableData dataWithCapacity:10000]; 
  OFSoundPlayer *player = [[OFSoundPlayer alloc] init];

  if(argc != 2 || (*argv[1] == '-' && strcmp(argv[1], "-") != 0))
    {
      fprintf(stderr,"Usage: \t\'sndplay filename[.ext]\' or\n\t\'sndplay -\' to accept sound data via a pipe.\n");
      return -1;
    }

  if(strcmp(argv[1], "-") == 0) {
    // Read from pipe
    NSFileHandle *readHandle = [NSFileHandle fileHandleWithStandardInput];
    NSData *inData = nil;
    while ((inData = [readHandle availableData]) && [inData length]) {
      [soundData appendData:inData];
    }  
    [player playData:soundData];
  } else {
    // Read from file
    [player playFile:[[NSString stringWithCString:argv[1]] stringByStandardizingPath]];
  }
  // If we ever get here, the file/data was not a valid sound.
  [pool release];
  return 0;
}
