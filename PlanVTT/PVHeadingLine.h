//
//  PVHeadingLine.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"
@class PVPositionTrackingView;
@class PVAngle;
@class PVAngleScreen;
@class PVHeadingLabel;

@class PVConstants;

@interface PVHeadingLine : UIView <PVHeadingAwareComponents> {
    PVAngle * _heading;
    float _arrowRadius;
    PVHeadingLabel * _label;
}

- (void)headingDidChangeTo:(PVHeading *)newHeading;

@property (retain) PVAngle * heading;
@property (assign) float arrowRadius;
@property (retain) PVHeadingLabel * label;

@end
