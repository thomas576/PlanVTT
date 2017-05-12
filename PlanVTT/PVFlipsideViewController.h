//
//  FlipsideViewController.h
//  PlanVTT
//
//  Created by Thomas DIER on 16/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"

@protocol PVFlipsideViewControllerDelegate;

@interface PVFlipsideViewController : UIViewController < PVLocationAwareComponents, PVHeadingAwareComponents> {
    
    IBOutlet UILabel * coordinateLatitude;
    IBOutlet UILabel * coordinateLongitude;
    IBOutlet UILabel * precision;
    IBOutlet UILabel * altitude;
    IBOutlet UILabel * speed;
    IBOutlet UILabel * course;
    IBOutlet UILabel * heading;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation;
- (void)headingDidChangeTo:(PVHeading *)newHeading;

- (IBAction)done:(id)sender;

@property (nonatomic, assign) id <PVFlipsideViewControllerDelegate> delegate;

@end


@protocol PVFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PVFlipsideViewController *)controller;
@end
