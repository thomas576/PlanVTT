//
//  PVMatrix.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVVector;

@interface PVMatrix : NSObject {
    double _a;
    double _b;
    double _c;
    double _d;
}

- (id)initWithCoefficientsA:(double)a B:(double)b C:(double)c D:(double)d;
- (id)initScalar:(double)scalar;

- (double)determinant;
- (PVMatrix *)inverseMatrix;
- (PVVector *)applyToVector:(PVVector *)vector;

@property (assign) double a;
@property (assign) double b;
@property (assign) double c;
@property (assign) double d;

@end
