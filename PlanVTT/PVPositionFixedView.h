//
//  PVPositionFixedView.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVPositionView.h"
@class PVRangeCircle;

@interface PVPositionFixedView : PVPositionView {
    PVRangeCircle * _rangeCircle;
}

@property (retain) PVRangeCircle * rangeCircle;

@end
