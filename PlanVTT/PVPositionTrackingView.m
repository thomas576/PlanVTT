//
//  PVPositionTrackingView.m
//  PlanVTT
//
//  Created by Thomas DIER on 18/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVPositionTrackingView.h"
#import "PVNonZoomingView.h"
#import "PVCoordinates.h"
#import "PVTrackingDot.h"
#import "PVHeadingLine.h"
#import "PVPositionView.h"
#import "PVScreen.h"
#import "PVAngle.h"

#import "PVConstants.h"

@implementation PVPositionTrackingView

- (id)initWithCoordinates:(PVCoordinates *)coord andSize:(CGSize)size {
    self = [super initWithFrame:CGRectMake(coord.screen.x, coord.screen.y, size.width, size.height)];
    if (self) {
        _scale = 1.0;
        self.coordinates = coord;
        
        _headingLine = [[PVHeadingLine alloc] initWithFrame:[self getCenteredCGRectOfSize:CGSizeMake(1000, 1000)]];
        [self addSubview:self.headingLine];
        
        CGFloat trackingDotDiameter = [PVConstants trackingDotDiameter];
        _trackingDot = [[PVTrackingDot alloc] initWithFrame:[self getCenteredCGRectOfSize:CGSizeMake(trackingDotDiameter, trackingDotDiameter)]];
        [self addSubview:self.trackingDot];
    }
    return self;
}

- (void)zoomScaleDidChangeTo:(CGFloat)theScale {
    self.scale = theScale;
}

- (void)setScale:(float)scale {
    _scale = scale;
    self.centerPoint = [self.coordinates screenCoordinatesWithScale:scale];
    [self setNeedsDisplay];
}
- (float)scale {
    return _scale;
}

- (void)setCoordinates:(PVCoordinates *)coordinates {
    if (coordinates != _coordinates) {
        [_coordinates release];
        _coordinates = [coordinates retain];
        self.centerPoint = [coordinates screenCoordinatesWithScale:self.scale];
    }
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    [super locationDidChangeTo:newLocation];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    [super headingDidChangeTo:newHeading];
    [self.headingLine headingDidChangeTo:newHeading];
}

- (void)dealloc
{
    self.trackingDot = nil;
    self.headingLine = nil;
    [super dealloc];
}

@synthesize trackingDot = _trackingDot;
@synthesize headingLine = _headingLine;

@end