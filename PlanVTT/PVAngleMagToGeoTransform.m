//
//  PVAngleMagToGeoTransform.m
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVAngleMagToGeoTransform.h"
#import "PVAngleMagnetic.h"
#import "PVAngleGeographic.h"

#import "PVConstants.h"

@implementation PVAngleMagToGeoTransform

static PVAngleMagToGeoTransform * singleton = nil;

- (id)initWithDeclinaison:(PVAngleGeographic *)dec {
    self = [super init];
    if (self) {
        self.declinaison = dec;
    }
    return self;
}

+ (void)setupWithDeclinaison:(PVAngleGeographic *)dec {
    if (singleton == nil) {
        singleton = [[PVAngleMagToGeoTransform alloc] initWithDeclinaison:dec];
    }
}

+ (PVAngleMagToGeoTransform *)getInstance {
    return singleton;
}

- (PVAngleGeographic *)angleGeoForMagnetic:(PVAngleMagnetic *)angMag {
    return [[[PVAngleGeographic alloc] initWithDegrees:(angMag.degrees + self.declinaison.degrees)] autorelease];
}

- (PVAngleMagnetic *)angleMagForGeographic:(PVAngleGeographic *)angGeo {
    return [[[PVAngleMagnetic alloc] initWithDegrees:(angGeo.degrees - self.declinaison.degrees)] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVAngleMagToGeoTransform : declinaison = %@ ;\n(la déclinaison est l'angle géographique qu'il faut ajouter à l'angle magnétique)", self.declinaison];
}

@synthesize declinaison = _declinaison;

@end
