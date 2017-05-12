//
//  PVMeters.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVMeters.h"
#import "PVVector.h"

@implementation PVMeters

- (id)initWithX:(double)x andY:(double)y {
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    return self;
}

- (id)initWithVector:(PVVector *)vector {
    return [self initWithX:vector.x andY:vector.y];
}

- (PVVector *)getVectorForCalculation {
    return [[[PVVector alloc] initWithX:self.x andY:self.y] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVMeters : X = %g m ; Y = %g m ;", self.x, self.y];
}

@synthesize x = _x;
@synthesize y = _y;

@end
