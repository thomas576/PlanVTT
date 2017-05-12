//
//  PVAngle.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVAngle.h"
#import "PVAngleScreen.h"
#import "PVAngleMagnetic.h"
#import "PVAngleGeographic.h"
#import "PVAngleGeoToScreenTransform.h"
#import "PVAngleMagToGeoTransform.h"

@implementation PVAngle

- (id)initWithAngleGeographic:(PVAngleGeographic *)angleGeo andMagnetic:(PVAngleMagnetic *)angleMag andScreen:(PVAngleScreen *)angleScreen
{
    self = [super init];
    if (self) {
        _angleGeographic = [angleGeo retain];
        _angleMagnetic = [angleMag retain];
        _angleScreen = [angleScreen retain];
    }
    return self;
}

- (id)initWithAngleGeographic:(PVAngleGeographic *)angleGeo 
{
    self = [super init];
    if (self) {
        self.angleGeographic = angleGeo;
    }
    return self;
}

- (id)initWithAngleMagnetic:(PVAngleMagnetic *)angleMag
{
    self = [super init];
    if (self) {
        self.angleMagnetic = angleMag;
    }
    return self;
}

- (id)initWithAngleScreen:(PVAngleScreen *)angleScreen
{
    self = [super init];
    if (self) {
        self.angleScreen = angleScreen;
    }
    return self;
}

- (void)setAngleGeographic:(PVAngleGeographic *)angleGeographic {
    if (angleGeographic != _angleGeographic) {
        [_angleGeographic release];
        _angleGeographic = [angleGeographic retain];
        [_angleMagnetic release];
        _angleMagnetic = [[[PVAngleMagToGeoTransform getInstance] angleMagForGeographic:angleGeographic] retain];
        [_angleScreen release];
        _angleScreen = [[[PVAngleGeoToScreenTransform getInstance] angleScreenForGeographic:angleGeographic] retain];
    }
}
- (PVAngleGeographic *)angleGeographic {
    return _angleGeographic;
}

- (void)setAngleMagnetic:(PVAngleMagnetic *)angleMagnetic {
    if (angleMagnetic != _angleMagnetic) {
        [_angleMagnetic release];
        _angleMagnetic = [angleMagnetic retain];
        [_angleGeographic release];
        _angleGeographic = [[[PVAngleMagToGeoTransform getInstance] angleGeoForMagnetic:angleMagnetic] retain];
        [_angleScreen release];
        _angleScreen = [[[PVAngleGeoToScreenTransform getInstance] angleScreenForGeographic:self.angleGeographic] retain];
    }
}
- (PVAngleMagnetic *)angleMagnetic {
    return _angleMagnetic;
}

- (void)setAngleScreen:(PVAngleScreen *)angleScreen {
    if (angleScreen != _angleScreen) {
        [_angleScreen release];
        _angleScreen = [angleScreen retain];
        [_angleGeographic release];
        _angleGeographic = [[[PVAngleGeoToScreenTransform getInstance] angleGeoForScreen:angleScreen] retain];
        [_angleMagnetic release];
        _angleMagnetic = [[[PVAngleMagToGeoTransform getInstance] angleMagForGeographic:self.angleGeographic] retain];
    }
}
- (PVAngleScreen *)angleScreen {
    return _angleScreen;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVAngle :\n\t- %@\n\t- %@\n\t- %@\n", [self.angleGeographic description], [self.angleMagnetic description], [self.angleScreen description]];
}

- (void)dealloc {
    [_angleGeographic release];
    [_angleMagnetic release];
    [_angleScreen release];
    [super dealloc];
}

@end
