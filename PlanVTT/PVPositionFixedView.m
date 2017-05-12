//
//  PVPositionFixedView.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVPositionFixedView.h"
#import "PVRangeCircle.h"

@implementation PVPositionFixedView

- (id)initWithCoordinates:(PVCoordinates *)coord andSize:(CGSize)size {
    self = [super initWithCoordinates:coord andSize:size];
    if (self) {
        _rangeCircle = [[PVRangeCircle alloc] initWithFrame:[self getCenteredCGRectOfSize:CGSizeMake(3000, 3000)] andCoordinates:coord];
        [self addSubview:self.rangeCircle];
    }
    return self;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    [super locationDidChangeTo:newLocation];
    [self.rangeCircle locationDidChangeTo:newLocation];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    [super headingDidChangeTo:newHeading];
}

- (void)dealloc
{
    self.rangeCircle = nil;
    [super dealloc];
}

@synthesize rangeCircle = _rangeCircle;

@end
