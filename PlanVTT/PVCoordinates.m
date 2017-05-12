//
//  PVCoordinates.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVCoordinates.h"
#import "PVMatrix.h"
#import "PVGeographic.h"
#import "PVGeoToMetersTransform.h"
#import "PVScreenToGeoTransform.h"
#import "PVMeters.h"
#import "PVScreen.h"

@implementation PVCoordinates

- (id)initWithGeographic:(PVGeographic *)geo andMeters:(PVMeters *)meters andScreen:(PVScreen *)screen {
    self = [super init];
    if (self) {
        _geographic = [geo retain];
        _meters = [meters retain];
        _screen = [screen retain];
    }
    return self;
}

- (id)initWithGeographic:(PVGeographic *)geo {
    self = [super init];
    if (self) {
        self.geographic = geo;
    }
    return self;
}

- (id)initWithMeters:(PVMeters *)meters {
    self = [super init];
    if (self) {
        self.meters = meters;
    }
    return self;
}

- (id)initWithScreen:(PVScreen *)screen {
    self = [super init];
    if (self) {
        self.screen = screen;
    }
    return self;
}

- (CGPoint)screenCoordinatesWithScale:(float)scale {
    return CGPointMake(((float)self.screen.point.x) * scale, ((float)self.screen.point.y) * scale);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVCoordinates :\n\t- %@\n\t- %@\n\t- %@\n", [self.geographic description], [self.meters description], [self.screen description]];
}

- (void)setGeographic:(PVGeographic *)geographic {
    if (geographic != _geographic) {
        [_geographic release];
        _geographic = [geographic retain];
        [_meters release];
        _meters = [[[PVGeoToMetersTransform getInstance] metersForGeographic:geographic] retain];
        [_screen release];
        _screen = [[[PVScreenToGeoTransform getInstance] screenForGeographic:geographic] retain];
    }
}
- (PVGeographic *)geographic {
    return _geographic;
}

- (void)setMeters:(PVMeters *)meters {
    if (meters != _meters) {
        [_meters release];
        _meters = [meters retain];
        [_geographic release];
        _geographic = [[[PVGeoToMetersTransform getInstance] geographicForMeters:meters] retain];
        [_screen release];
        _screen = [[[PVScreenToGeoTransform getInstance] screenForGeographic:_geographic] retain];
    }
}
- (PVMeters *)meters {
    return _meters;
}

- (void)setScreen:(PVScreen *)screen {
    if (screen != _screen) {
        [_screen release];
        _screen = [screen retain];
        [_geographic release];
        _geographic = [[[PVScreenToGeoTransform getInstance] geographicForScreen:screen] retain];
        [_meters release];
        _meters = [[[PVGeoToMetersTransform getInstance] metersForGeographic:_geographic] retain];
    }
}
- (PVScreen *)screen {
    return _screen;
}

- (void)dealloc {
    [_geographic release];
    [_meters release];
    [_screen release];
    [super dealloc];
}

@end