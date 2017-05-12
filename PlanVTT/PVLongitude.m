//
//  PVLongitude.m
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVLongitude.h"


@implementation PVLongitude

- (id)initWithEorW:(NSString *)letter andDegrees:(double)deg minutes:(double)min secondes:(double)sec {
    double angleDecimal = deg + min/60.0 + sec/3600.0;
    if ([letter isEqualToString:@"W"]) {
        angleDecimal = -1 * angleDecimal;
    }
    return [self initWithDegrees:angleDecimal];
}

- (NSString *)getLetterEorW {
    if (self.degrees < 0) return @"W";
    return @"E";
}

- (NSString *)getStandardGPSRepresentation {
    return [NSString stringWithFormat:@"%@ %@", [self getLetterEorW], [self getDegreesMinSecRepresentation]];
}

// degrees property override
- (void)setDegrees:(double)degrees {
    degrees = fmod(degrees, 360.0);
    if (degrees > 180.0) degrees -= 360.0;
    if (degrees <= -180.0) degrees += 360.0;
    _degrees = degrees;
    _radians = degrees * M_PI/180;
}
- (double)degrees {
    return _degrees;
}

// radians property override
- (void)setRadians:(double)radians {
    radians = fmod(radians, 2*M_PI);
    if (radians > M_PI) radians -= 2*M_PI;
    if (radians <= -M_PI) radians += 2*M_PI;
    _radians = radians;
    _degrees = _radians * 180/M_PI;
}
- (double)radians {
    return _radians;
}

@end
