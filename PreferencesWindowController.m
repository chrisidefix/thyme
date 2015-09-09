//
//  PreferencesWindowController.m
//  Thyme
//
//  Created by João on 3/18/13.
//
//

#import "PreferencesWindowController.h"

@interface PreferencesWindowController ()
- (void)onWindowResignKey;
@end

@implementation PreferencesWindowController

@synthesize startPauseShortcutRecorder;
@synthesize restartShortcutRecorder;
@synthesize finishShortcutRecorder;
@synthesize pauseOnSleepButton;
@synthesize pauseOnScreensaverButton;

@synthesize showCountdownButton;
@synthesize countdownHourValueField;
@synthesize countdownMinValueField;
@synthesize countdownSecValueField;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;

}
- (void)windowDidLoad
{
    [super windowDidLoad];
    
    NSUserDefaultsController *defaults = [NSUserDefaultsController sharedUserDefaultsController];
    
    [self.startPauseShortcutRecorder bind:NSValueBinding toObject:defaults withKeyPath:@"values.startPause" options:nil];
    [self.restartShortcutRecorder bind:NSValueBinding toObject:defaults withKeyPath:@"values.restart" options:nil];
    [self.finishShortcutRecorder bind:NSValueBinding toObject:defaults withKeyPath:@"values.finish" options:nil];
    
    [self.pauseOnSleepButton bind:NSValueBinding toObject:defaults withKeyPath:@"values.pauseOnSleep" options:nil];
    [self.pauseOnScreensaverButton bind:NSValueBinding toObject:defaults withKeyPath:@"values.pauseOnScreensaver" options:nil];
    
    [self.showCountdownButton bind:NSValueBinding toObject:defaults withKeyPath:@"values.showCountdown" options:nil];
    [self.countdownHourValueField bind:NSValueBinding toObject:defaults withKeyPath:@"values.countdownHourValue" options:nil];
    [self.countdownMinValueField bind:NSValueBinding toObject:defaults withKeyPath:@"values.countdownMinValue" options:nil];
    [self.countdownSecValueField bind:NSValueBinding toObject:defaults withKeyPath:@"values.countdownSecValue" options:nil];
    
    [self.startPauseShortcutRecorder clearButtonRect];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onWindowResignKey) name:NSWindowDidResignKeyNotification object:nil];
}

- (void)onWindowResignKey {
    [self.window close];
}

#pragma mark SRRecorderControlDelegate

- (BOOL)shortcutRecorder:(SRRecorderControl *)aRecorder canRecordShortcut:(NSDictionary *)aShortcut {
    return !SRShortcutEqualToShortcut([self.startPauseShortcutRecorder objectValue], aShortcut) &&
           !SRShortcutEqualToShortcut([self.restartShortcutRecorder objectValue], aShortcut) &&
           !SRShortcutEqualToShortcut([self.finishShortcutRecorder objectValue], aShortcut);
}

@end
