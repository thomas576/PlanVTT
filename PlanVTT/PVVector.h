//
//  PVVector.h
//  PlanVTT
//
//  Created by Thomas DIER on 20/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PVVector : NSObject {
    double _x;
    double _y;
}

- (id)initWithX:(double)x andY:(double)y;

- (PVVector *)getOppositeVector;
- (PVVector *)addToVector:(PVVector *)vector;

@property (assign) double x;
@property (assign) double y;

@end
