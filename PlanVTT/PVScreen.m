//
//  PVScreen.m
//  PlanVTT
//
//  Created by Thomas DIER on 20/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVScreen.h"
#import "PVVector.h"

@implementation PVScreen

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

- (void)setPoint:(CGPoint)point {
    self.x = (double)point.x;
    self.y = (double)point.y;
}
- (CGPoint)point {
    return CGPointMake((CGFloat)self.x, (CGFloat)self.y);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVScreen : x = %g px ; y = %g px ;", self.x, self.y];
}

@synthesize x = _x;
@synthesize y = _y;

@end
