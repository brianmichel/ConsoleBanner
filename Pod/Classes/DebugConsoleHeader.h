//
//  DebugConsoleHeader.h
//
//  Created by Brian Michel on 4/10/15.
//  Copyright (c) 2015 Brian Michel. All rights reserved.
//

@import Foundation;

/*
 A class that will automatically check for a debugger and print the debug consonle banner
 if a debugger is attached.
 
 As long as this file in included in your target it will automatically print the banner when
 a debugger is attached. It will attemp to look for a banner.txt file in the main bundle to print
 before OS information is printed.
 */
@interface DebugConsoleHeader : NSObject

/*
 Whether or not a debugger is attached.
 
 Will return YES if a debugger is attached, NO if one is not connected.
 */
+ (BOOL)checkForDebugger;

/*
 Check whether a debugger is attached, and if so, print the debug header.
 */
+ (void)checkForDebuggerAndPrintConsoleHeader;
@end
