//
//  PVLatitude.m
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVLatitude.h"


@implementation PVLatitude

- (id)initWithNorS:(NSString *)letter andDegrees:(double)deg minutes:(double)min secondes:(double)sec {
    double angleDecimal = deg + min/60.0 + sec/3600.0;
    if ([letter isEqualToString:@"S"]) {
        angleDecimal = -1 * angleDecimal;
    }
    return [self initWithDegrees:angleDecimal];
}

- (NSString *)getLetterNorS {
    if (self.degrees < 0) return @"S";
    return @"N";
}

- (NSString *)getStandardGPSRepresentation {
    return [NSString stringWithFormat:@"%@ %@", [self getLetterNorS], [self getDegreesMinSecRepresentation]];
}

// degrees property override
- (void)setDegrees:(double)degrees {
    degrees = fmod(degrees, 360.0);
    if (degrees > 180.0) degrees -= 360.0;
    if (degrees <= -180.0) degrees += 360.0;
    if (degrees > 90 || degrees < -90) NSLog(@"La latitude donnée est au delà de [-90;+90] !");
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
    if (radians > M_PI/2 || radians < -M_PI/2) NSLog(@"La latitude donnée est au delà de [-pi/2;+pi/2] !");
    _radians = radians;
    _degrees = _radians * 180/M_PI;
}
- (double)radians {
    return _radians;
}

@end
