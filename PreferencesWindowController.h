//
//  PreferencesWindowController.h
//  Thyme
//
//  Created by João on 3/18/13.
//
//

#import <Cocoa/Cocoa.h>
#import "ShortcutRecorder/ShortcutRecorder.h"

@interface PreferencesWindowController : NSWindowController <SRRecorderControlDelegate> {
    SRRecorderControl *startPauseShortcutRecorder;
    SRRecorderControl *restartShortcutRecorder;
    SRRecorderControl *finishShortcutRecorder;
    NSButton *pauseOnSleepButton;
    NSButton *pauseOnScreensaverButton;
    NSButton *showCountdownButton;
    NSTextField *countdownHourValueField;
    NSTextField *countdownMinValueField;
    NSTextField *countdownSecValueField;
}

@property (nonatomic, retain) IBOutlet SRRecorderControl *startPauseShortcutRecorder;
@property (nonatomic, retain) IBOutlet SRRecorderControl *restartShortcutRecorder;
@property (nonatomic, retain) IBOutlet SRRecorderControl *finishShortcutRecorder;
@property (nonatomic, retain) IBOutlet NSButton *pauseOnSleepButton;
@property (nonatomic, retain) IBOutlet NSButton *pauseOnScreensaverButton;
@property (nonatomic, retain) IBOutlet NSButton *showCountdownButton;
@property (nonatomic, retain) IBOutlet NSTextField *countdownHourValueField;
@property (nonatomic, retain) IBOutlet NSTextField *countdownMinValueField;
@property (nonatomic, retain) IBOutlet NSTextField *countdownSecValueField;

@end
