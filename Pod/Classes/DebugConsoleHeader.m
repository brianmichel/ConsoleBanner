//
//  DebugConsoleHeader.m
//
//  Created by Brian Michel on 4/10/15.
//  Copyright (c) 2015 Brian Michel. All rights reserved.
//

#import "DebugConsoleHeader.h"
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/sysctl.h>

// Taken from https://developer.apple.com/library/mac/qa/qa1361/_index.html
static bool AmIBeingDebugged(void)
// Returns true if the current process is being debugged (either
// running under the debugger or has a debugger attached post facto).
{
    int                 junk;
    int                 mib[4];
    struct kinfo_proc   info;
    size_t              size;

    // Initialize the flags so that, if sysctl fails for some bizarre
    // reason, we get a predictable result.

    info.kp_proc.p_flag = 0;

    // Initialize mib, which tells sysctl the info we want, in this case
    // we're looking for information about a specific process ID.

    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();

    // Call sysctl.

    size = sizeof(info);
    junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    assert(junk == 0);

    // We're being debugged if the P_TRACED flag is set.

    return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
}

@implementation DebugConsoleHeader

+ (void)load {
    [[self class] checkForDebuggerAndPrintConsoleHeader];
}

+ (BOOL)checkForDebugger {
    return AmIBeingDebugged();
}

+ (void)checkForDebuggerAndPrintConsoleHeader {
    if ([[self class] checkForDebugger]) {
        [[self class] printBanner];
        [[self class] printSystemInformation];
    }
}

+ (void)printBanner {
    NSString *bannerPath = [[NSBundle mainBundle] pathForResource:@"banner" ofType:@"txt"];

    if (bannerPath) {
        NSError *error;
        NSString *banner = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:bannerPath] encoding:NSUTF8StringEncoding error:&error];
        NSArray *lines = [banner componentsSeparatedByString:@"\n"];
        for (NSString *line in lines) {
            puts([line UTF8String]);
        }
    }
}

+ (void)printSystemInformation {
    NSString *device = [UIDevice currentDevice].model;
    NSString *osName = [UIDevice currentDevice].systemName;
    NSString *osVersion = [UIDevice currentDevice].systemVersion;

    printf("\tDevice: %s\n", [device UTF8String]);
    printf("\tOS: %s\t\tVersion: %s\n", [osName UTF8String], [osVersion UTF8String]);
}

@end
