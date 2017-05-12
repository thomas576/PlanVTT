//
//  PVNonZoomingView.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVNonZoomingView.h"
#import "PVPositionTrackingView.h"
#import "PVCoordinates.h"
#import "PVMatrix.h"
#import "PVScreen.h"

#import "PVConstants.h"

@implementation PVNonZoomingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2];
        self.clipsToBounds = YES;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord {
    self = [self initWithFrame:frame];
    if (self) {
        _positionTrackingView = [[PVPositionTrackingView alloc] initWithCoordinates:coord andSize:CGSizeMake(500, 500)];
        [self addSubview:self.positionTrackingView];
    }
    return self;
}

- (void)zoomScaleDidChangeTo:(CGFloat)theScale {
    [self.positionTrackingView zoomScaleDidChangeTo:theScale];
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    [super locationDidChangeTo:newLocation];
    [self.positionTrackingView locationDidChangeTo:newLocation];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    [super headingDidChangeTo:newHeading];
    [self.positionTrackingView headingDidChangeTo:newHeading];
}

- (void)dealloc
{
    self.positionTrackingView = nil;
    [super dealloc];
}

@synthesize positionTrackingView = _positionTrackingView;

@end
