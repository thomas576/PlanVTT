//
//  PVScrollView.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVZoomScaleAwareComponents.h"
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"
@class PVZoomingView;
@class PVNonZoomingView;
@class PVGeoToMetersTransform;
@class PVScreenToGeoTransform;
@class PVCoordinates;
@class PVScreen;
@class PVGeographic;
@class PVAngle;

@class PVConstants;

@interface PVScrollView : UIScrollView <PVZoomScaleAwareComponents, PVLocationAwareComponents, PVHeadingAwareComponents> {
    PVNonZoomingView * _nonZoomingView;
    PVZoomingView * _zoomingView;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation;
- (void)headingDidChangeTo:(PVHeading *)newHeading;

//- (void)test;

@property (retain) PVNonZoomingView * nonZoomingView;
@property (retain) PVZoomingView * zoomingView;

@end
