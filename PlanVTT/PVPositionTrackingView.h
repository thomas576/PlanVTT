//
//  PVPositionTrackingView.h
//  PlanVTT
//
//  Created by Thomas DIER on 18/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVZoomScaleAwareComponents.h"
#import "PVPositionView.h"
@class PVNonZoomingView;
@class PVCoordinates;
@class PVTrackingDot;
@class PVHeadingLine;
@class PVScreen;
@class PVAngle;

@class PVConstants;

@interface PVPositionTrackingView : PVPositionView <PVZoomScaleAwareComponents> {
    float _scale;
    
    PVTrackingDot * _trackingDot;
    PVHeadingLine * _headingLine;
}

@property (assign) float scale;

@property (retain) PVTrackingDot * trackingDot;
@property (retain) PVHeadingLine * headingLine;

@end
