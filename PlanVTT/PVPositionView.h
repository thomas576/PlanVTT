//
//  PVPositionView.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVZoomScaleAwareComponents.h"
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"
@class PVCoordinates;
@class PVMatrix;
@class PVScreen;

@interface PVPositionView : UIView <PVZoomScaleAwareComponents, PVLocationAwareComponents, PVHeadingAwareComponents> {
    PVCoordinates * _coordinates;
    CGPoint _centerPoint;
}

- (id)initWithCoordinates:(PVCoordinates *)coord andSize:(CGSize)size;
- (CGRect)getCenteredCGRectOfSize:(CGSize)size;

- (void)locationDidChangeTo:(PVLocation *)newLocation;
- (void)headingDidChangeTo:(PVHeading *)newHeading;

@property (retain) PVCoordinates * coordinates;
@property (assign) CGPoint centerPoint;

@end
