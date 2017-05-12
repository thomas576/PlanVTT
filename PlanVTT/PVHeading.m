//
//  PVHeading.m
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVHeading.h"
#import "PVAngle.h"
#import "PVAngleMagnetic.h"

@implementation PVHeading

- (id)initWithAngle:(PVAngle *)angle andAccuracy:(double)accuracy {
    self = [super init];
    if (self) {
        _heading = [angle retain];
        self.headingAccuracy = accuracy;
    }
    return self;
}

- (id)initWithHeading:(CLHeading *)head {
    self = [super init];
    if (self) {
        PVAngleMagnetic * angleMag = [[PVAngleMagnetic alloc] initWithDegrees:head.magneticHeading];
        PVAngle * ang = [[PVAngle alloc] initWithAngleMagnetic:angleMag];
        [angleMag release];
        _heading = ang;
        
        self.headingAccuracy = head.headingAccuracy;
    }
    return self;
}

- (NSString *)getHeadingDescription {
    return [self.heading.angleGeographic getDegreesOnlyRepresentation];
}

- (void)dealloc {
    [_heading release];
    [super dealloc];
}

@synthesize heading = _heading;
@synthesize headingAccuracy;

@end
