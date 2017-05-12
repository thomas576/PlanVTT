//
//  FlipsideViewController.m
//  PlanVTT
//
//  Created by Thomas DIER on 16/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVFlipsideViewController.h"
#import "PVLocation.h"
#import "PVHeading.h"
#import "PVLocationController.h"

@implementation PVFlipsideViewController

- (void)dealloc
{
    [coordinateLatitude release];
    [coordinateLongitude release];
    [precision release];
    [altitude release];
    [speed release];
    [course release];
    [heading release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    coordinateLatitude.text = [newLocation getLatitudeDescription];
    coordinateLongitude.text = [newLocation getLongitudeDescription];
    precision.text = [newLocation getPrecisionDescription];
    altitude.text = [newLocation getAltitudeDescription];
    speed.text = [newLocation getSpeedDescription];
    course.text = [newLocation getCourseDescription];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    heading.text = [newHeading getHeadingDescription];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    
    // Ask for notifications
    [[PVLocationController getInstance] addNotifiedComponent:self];
}

- (void)viewDidUnload
{
    [coordinateLatitude release];
    coordinateLatitude = nil;
    [coordinateLongitude release];
    coordinateLongitude = nil;
    [precision release];
    precision = nil;
    [altitude release];
    altitude = nil;
    [speed release];
    speed = nil;
    [course release];
    course = nil;
    [heading release];
    heading = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@synthesize delegate=_delegate;

@end
