//
//  PVMatrix.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVMatrix.h"
#import "PVVector.h"

@implementation PVMatrix

- (id)initWithCoefficientsA:(double)a B:(double)b C:(double)c D:(double)d {
    self = [super init];
    if (self) {
        _a = a; _b = b; _c = c; _d = d;
    }
    return self;
}

- (id)initScalar:(double)scalar {
    return [self initWithCoefficientsA:scalar B:0.0 C:0.0 D:scalar];
}

- (double)determinant {
    return self.a * self.d - self.c * self.b;
}

- (PVMatrix *)inverseMatrix {
    double det = [self determinant];
    
    if (det == 0) {
        NSLog(@"Déterminant nul pour la matrice.");
        return [[[PVMatrix alloc] initScalar:1.0] autorelease];
    } else {
        return [[[PVMatrix alloc] initWithCoefficientsA:(self.d/det) B:(-1 * self.b/det) C:(-1 * self.c/det) D:(self.a/det)] autorelease];
    }
}

- (PVVector *)applyToVector:(PVVector *)vector {
    return [[[PVVector alloc] initWithX:(self.a * vector.x + self.b * vector.y) andY:(self.c * vector.x + self.d * vector.y)] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVMatrix :\n\t\ta = %g ;\t b = %g ;\n\t\tc = %g ;\t d = %g ;\n", self.a, self.b, self.c, self.d];
}

@synthesize a = _a;
@synthesize b = _b;
@synthesize c = _c;
@synthesize d = _d;

@end
