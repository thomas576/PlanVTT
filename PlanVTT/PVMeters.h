//
//  PVMeters.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVVector;

@interface PVMeters : NSObject {
    double _x;
    double _y;
}

- (id)initWithX:(double)x andY:(double)y;
- (id)initWithVector:(PVVector *)vector;

- (PVVector *)getVectorForCalculation;

@property (assign) double x;
@property (assign) double y;

@end
