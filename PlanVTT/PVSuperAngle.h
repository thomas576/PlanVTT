//
//  PVSuperAngle.h
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PVSuperAngle : NSObject {
    double _radians;
    double _degrees;
}

- (id)initWithDegrees:(double)deg;
- (id)initWithRadians:(double)rad;

- (NSString *)getDegreesMinSecRepresentation;
- (NSString *)getDegreesOnlyRepresentation;

@property (assign) double radians;
@property (assign) double degrees;

@end
