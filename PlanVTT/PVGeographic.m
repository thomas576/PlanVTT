//
//  PVGeographic.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"
#import "PVVector.h"

@implementation PVGeographic

- (id)initWithLongitude:(PVLongitude *)lon andLatitude:(PVLatitude *)lat {
    self = [super init];
    if (self) {
        self.longitude = lon;
        self.latitude = lat;
    }
    return self;
}

- (id)initWithVector:(PVVector *)vector {
    return [self initWithLongitude:[[[PVLongitude alloc] initWithRadians:vector.x] autorelease] andLatitude:[[[PVLatitude alloc] initWithRadians:vector.y] autorelease]];
}

- (PVVector *)getVectorForCalculation {
    return [[[PVVector alloc] initWithX:self.longitude.radians andY:self.latitude.radians] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVGeographic : lon = %@ ; lat = %@ ;", [self.longitude getStandardGPSRepresentation], [self.latitude getStandardGPSRepresentation]];
}

- (void)dealloc {
    [_longitude release];
    [_latitude release];
    [super dealloc];
}

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;

@end
