//
//  PVVector.m
//  PlanVTT
//
//  Created by Thomas DIER on 20/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVVector.h"


@implementation PVVector

- (id)initWithX:(double)x andY:(double)y {
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    return self;
}

- (PVVector *)getOppositeVector {
    return [[[PVVector alloc] initWithX:(-1 * self.x) andY:(-1 * self.y)] autorelease];
}

- (PVVector *)addToVector:(PVVector *)vector {
    return [[[PVVector alloc] initWithX:(self.x + vector.x) andY:(self.y + vector.y)] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVVector : x = %g ; y = %g ;", self.x, self.y];
}

@synthesize x = _x;
@synthesize y = _y;

@end
