//
//  PVZoomingView.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVZoomingView.h"
#import "PVMapView.h"
#import "PVPositionView.h"
#import "PVCoordinates.h"
#import "PVPositionFixedView.h"

@implementation PVZoomingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        _mapView = [[PVMapView alloc] initWithFrame:frame];
        self.mapView.contentScaleFactor = 1.0;
        [self addSubview:self.mapView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord {
    self = [self initWithFrame:frame];
    if (self) {
        _positionFixedView = [[PVPositionFixedView alloc] initWithCoordinates:coord andSize:CGSizeMake(3000, 3000)];
        [self addSubview:self.positionFixedView];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // to handle the interaction between CATiledLayer and high resolution screens, we need to manually set the
    // tiling view's contentScaleFactor to 1.0. (If we omitted this, it would be 2.0 on high resolution screens,
    // which would cause the CATiledLayer to ask us for tiles of the wrong scales.)
    self.mapView.contentScaleFactor = 1.0;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    [super locationDidChangeTo:newLocation];
    [self.positionFixedView locationDidChangeTo:newLocation];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    [super headingDidChangeTo:newHeading];
    [self.positionFixedView headingDidChangeTo:newHeading];
}

- (void)dealloc
{
    self.mapView = nil;
    [super dealloc];
}

@synthesize mapView = _mapView;
@synthesize positionFixedView = _positionFixedView;

@end
