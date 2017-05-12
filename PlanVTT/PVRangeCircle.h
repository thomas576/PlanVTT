//
//  PVRangeCircle.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVLocationAwareComponents.h"
@class PVCoordinates;
@class PVScreen;
@class PVMeters;

@interface PVRangeCircle : UIView <PVLocationAwareComponents> {
    NSArray * _ranges;
    PVCoordinates * _coordinates;
    NSMutableArray * _calculatedRanges;
}

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord;
- (void)calculateRangesOnScreen;
- (CGRect)getCenteredCGRectOfSize:(CGSize)size;

- (void)locationDidChangeTo:(PVLocation *)newLocation;

@property (retain) NSArray * ranges;
@property (retain) PVCoordinates * coordinates;

@end
