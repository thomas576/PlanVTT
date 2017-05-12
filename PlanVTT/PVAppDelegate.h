//
//  PlanVTTAppDelegate.h
//  PlanVTT
//
//  Created by Thomas DIER on 16/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PVMainViewController;

@interface PVAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PVMainViewController *mainViewController;

@end
