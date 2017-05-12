//
//  PlanVTTAppDelegate.m
//  PlanVTT
//
//  Created by Thomas DIER on 16/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVAppDelegate.h"

#import "PVMainViewController.h"
#import "PVLocationController.h"

@implementation PVAppDelegate


@synthesize window=_window;

@synthesize mainViewController=_mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the main view controller's view to the window and display.
    self.window.rootViewController = self.mainViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Start the localisation sevice
    [[PVLocationController getInstance] startStandardUpdates];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Stop the localisation sevice
    [[PVLocationController getInstance] stopStandardUpdates];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Stop the localisation sevice
    [[PVLocationController getInstance] stopStandardUpdates];
}

- (void)dealloc
{
    [_window release];
    [_mainViewController release];
    [super dealloc];
}

@end
