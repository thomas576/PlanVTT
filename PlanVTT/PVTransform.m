//
//  PVTransform.m
//  PlanVTT
//
//  Created by Thomas DIER on 20/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVTransform.h"
#import "PVMatrix.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVVector.h"

@implementation PVTransform

- (id)initWithMatrix:(PVMatrix *)matrix andOrigin:(PVVector *)origin {
    self = [super init];
    if (self) {
        self.matrix = matrix;
        self.origin = origin;
    }
    return self;
}

- (void)setMatrix:(PVMatrix *)matrix {
    if (matrix != _matrix) {
        [_matrix release];
        _matrix = [matrix retain];
        [_inverseMatrix release];
        _inverseMatrix = [[matrix inverseMatrix] retain];
    }
}
- (PVMatrix *)matrix {
    return _matrix;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVTransform :\n\tmatrix = %@\n\torigin = %@\n\tinverseMatrix = %@\n", [self.matrix description], [self.origin description], [self.inverseMatrix description]];
}

- (void)dealloc {
    [_matrix release];
    [_origin release];
    [_inverseMatrix release];
    [super dealloc];
}

@synthesize origin = _origin;
@synthesize inverseMatrix = _inverseMatrix;

@end
