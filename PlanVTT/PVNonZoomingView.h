//
//  PVNonZoomingView.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVView.h"
#import "PVZoomScaleAwareComponents.h"
@class PVPositionTrackingView;
@class PVCoordinates;
@class PVMatrix;
@class PVScreen;

@class PVConstants;

@interface PVNonZoomingView : PVView <PVZoomScaleAwareComponents> {
    PVPositionTrackingView * _positionTrackingView;
}

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord;

@property (retain) PVPositionTrackingView * positionTrackingView;

@end
