//
//  PVSuperAngle.m
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVSuperAngle.h"


@implementation PVSuperAngle

- (id)initWithDegrees:(double)deg {
    self = [super init];
    if (self) {
        self.degrees = deg;
    }
    return self;
}

- (id)initWithRadians:(double)rad {
    self = [super init];
    if (self) {
        self.radians = rad;
    }
    return self;
}

- (NSString *)getDegreesMinSecRepresentation {
    double absoluteDegrees = fabs(self.degrees);
    NSNumber * numberDeg = [[NSNumber alloc] initWithDouble:trunc(absoluteDegrees)];
    int degreesInteger = [numberDeg intValue];
    
    double decimalPart = absoluteDegrees - [numberDeg doubleValue];
    double minutes = decimalPart * 60.0;
    NSNumber * numberMin = [[NSNumber alloc] initWithDouble:trunc(minutes)];
    int minutesInteger = [numberMin intValue];
    
    double decimalDecimalPart = minutes - [numberMin doubleValue];
    double seconds = decimalDecimalPart * 60.0;
    
    [numberDeg release];
    [numberMin release];
    
    NSString * strDeg;
    if (degreesInteger < 10) {
        strDeg = [[NSString alloc] initWithFormat:@"0%d°", degreesInteger];
    } else {
        strDeg = [[NSString alloc] initWithFormat:@"%d°", degreesInteger];
    }
    
    NSString * strMin;
    if (minutesInteger < 10) {
        strMin = [[NSString alloc] initWithFormat:@"0%d'", minutesInteger];
    } else {
        strMin = [[NSString alloc] initWithFormat:@"%d'", minutesInteger];
    }
    
    NSString * strSec;
    if (seconds < 10.0) {
        strSec = [[NSString alloc] initWithFormat:@"0%.4f''", seconds];
    } else {
        strSec = [[NSString alloc] initWithFormat:@"%.4f''", seconds];
    }
    
    NSString * str = [NSString stringWithFormat:@"%@ %@ %@", strDeg, strMin, strSec];
    [strDeg release];
    [strMin release];
    [strSec release];
    return str;
}

- (NSString *)getDegreesOnlyRepresentation {
    NSNumber * numberDegRounded = [[NSNumber alloc] initWithDouble:round(self.degrees)];
    int intDegRounded = [numberDegRounded intValue];
    if (intDegRounded == 360) intDegRounded = 0;
    [numberDegRounded release];
    
    NSString * strDeg;
    if (intDegRounded < 10) {
        strDeg = [NSString stringWithFormat:@"00%d°", intDegRounded];
    } else if (intDegRounded < 100) {
        strDeg = [NSString stringWithFormat:@"0%d°", intDegRounded];
    } else {
        strDeg = [NSString stringWithFormat:@"%d°", intDegRounded];
    }
    
    return strDeg;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVSuperAngle : rad = %g ; deg = %g° ;", self.radians, self.degrees];
}

// degrees property
- (void)setDegrees:(double)degrees {
    degrees = fmod(degrees, 360.0);
    if (degrees < 0) degrees += 360.0;
    _degrees = degrees;
    _radians = degrees * M_PI/180;
}
- (double)degrees {
    return _degrees;
}

// radians property
- (void)setRadians:(double)radians {
    radians = fmod(radians, 2*M_PI);
    if (radians < 0) radians += 2*M_PI;
    _radians = radians;
    _degrees = _radians * 180/M_PI;
}
- (double)radians {
    return _radians;
}

@end
