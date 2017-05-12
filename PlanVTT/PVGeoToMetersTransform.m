//
//  PVGeoToMetersTransform.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVGeoToMetersTransform.h"
#import "PVTransform.h"
#import "PVMatrix.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVVector.h"
#import "PVMeters.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

#import "PVConstants.h"

@implementation PVGeoToMetersTransform

static PVGeoToMetersTransform * singleton = nil;

- (id)initByCalculatingFromOriginWithItsCoordinates:(PVCoordinates *)coord {
    double lonCoeff = cosf(coord.geographic.latitude.radians) * [PVConstants earthEquatorialRadius];
    double latCoeff = [PVConstants earthPolarRadius];
    PVMatrix * matrix = [[PVMatrix alloc] initWithCoefficientsA:lonCoeff B:0.0 C:0.0 D:latCoeff];
    PVVector * origin = [[coord.meters getVectorForCalculation] addToVector:[[matrix applyToVector:[coord.geographic getVectorForCalculation]] getOppositeVector]];
    
    self = [self initWithMatrix:matrix andOrigin:origin];
    
    [matrix release];
    return self;
}

+ (void)setupByCalculatingFromOriginWithItsCoordinates:(PVCoordinates *)coord {
    if (singleton == nil) {
        singleton = [[PVGeoToMetersTransform alloc] initByCalculatingFromOriginWithItsCoordinates:coord];
    }
}

+ (PVGeoToMetersTransform *)getInstance {
    return singleton;
}

- (PVMeters *)metersForGeographic:(PVGeographic *)geo {
    PVVector * geoVec = [geo getVectorForCalculation];
    PVVector * metersVec = [[self.matrix applyToVector:geoVec] addToVector:self.origin];
    return [[[PVMeters alloc] initWithVector:metersVec] autorelease];
}

- (PVGeographic *)geographicForMeters:(PVMeters *)meters {
    PVVector * metersVec = [meters getVectorForCalculation];
    PVVector * geoVec = [self.inverseMatrix applyToVector:[metersVec addToVector:[self.origin getOppositeVector]]];
    return [[[PVGeographic alloc] initWithVector:geoVec] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVGeoToMetersTransform : %@", [super description]];
}

@end
