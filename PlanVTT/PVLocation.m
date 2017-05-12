//
//  PVLocation.m
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVLocation.h"
#import "PVCoordinates.h"
#import "PVMatrix.h"
#import "PVGeographic.h"
#import "PVGeoToMetersTransform.h"
#import "PVScreenToGeoTransform.h"
#import "PVMeters.h"
#import "PVScreen.h"
#import "PVLongitude.h"
#import "PVLatitude.h"
#import "PVAngle.h"
#import "PVAngleGeoToScreenTransform.h"
#import "PVAngleMagToGeoTransform.h"
#import "PVAngleGeographic.h"

@implementation PVLocation

- (id)initWithLocation:(CLLocation *)loc {
    self = [super init];
    if (self) {
        _location = [loc retain];
    }
    return self;
}

- (NSString *)getLongitudeDescription {
    return [self.coordinates.geographic.longitude getStandardGPSRepresentation];
}

- (NSString *)getLatitudeDescription {
    return [self.coordinates.geographic.latitude getStandardGPSRepresentation];
}

- (NSString *)getPrecisionDescription {
    NSString * strHorizontalAccuracy;
    if (self.horizontalAccuracy > 10) {
        NSNumber * numberHorizontalAccuracy = [[NSNumber alloc] initWithDouble:round(self.horizontalAccuracy)];
        int intHorizontalAccuracy = [numberHorizontalAccuracy intValue];
        [numberHorizontalAccuracy release];
        strHorizontalAccuracy = [[NSString alloc] initWithFormat:@"%d", intHorizontalAccuracy];
    } else {
        strHorizontalAccuracy = [[NSString alloc] initWithFormat:@"%.1f", self.horizontalAccuracy];
    }
    
    NSString * strVerticalAccuracy;
    if (self.verticalAccuracy > 10) {
        NSNumber * numberVerticalAccuracy = [[NSNumber alloc] initWithDouble:round(self.verticalAccuracy)];
        int intVerticalAccuracy = [numberVerticalAccuracy intValue];
        [numberVerticalAccuracy release];
        strVerticalAccuracy = [[NSString alloc] initWithFormat:@"%d", intVerticalAccuracy];
    } else {
        strVerticalAccuracy = [[NSString alloc] initWithFormat:@"%.1f", self.verticalAccuracy];
    }
    
    NSString * str = [NSString stringWithFormat:@"Précision 2D : %@m, verticale : %@m", strHorizontalAccuracy, strVerticalAccuracy];
    [strHorizontalAccuracy release];
    [strVerticalAccuracy release];
    
    return str;
}

- (NSString *)getAltitudeDescription {
    return [NSString stringWithFormat:@"%d", (int)round(self.altitude)];
}

- (NSString *)getSpeedDescription {
    NSString * str;
    if (self.speed < 100) {
        str = [NSString stringWithFormat:@"%.1f", self.speed];
    } else {
        str = [NSString stringWithFormat:@"%d", (int)round(self.speed)];
    }
    
    return str;
}

- (NSString *)getCourseDescription {
    return [self.course.angleGeographic getDegreesOnlyRepresentation];
}

- (PVCoordinates *)coordinates {
    PVLongitude * lon = [[PVLongitude alloc] initWithDegrees:_location.coordinate.longitude];
    PVLatitude * lat = [[PVLatitude alloc] initWithDegrees:_location.coordinate.latitude];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:lon andLatitude:lat];
    PVCoordinates * coord = [[PVCoordinates alloc] initWithGeographic:geo];
    [geo release];
    [lon release];
    [lat release];
    return [coord autorelease];
}

- (double)altitude {
    return _location.altitude;
}

- (double)verticalAccuracy {
    return _location.verticalAccuracy;
}

- (double)horizontalAccuracy {
    return _location.horizontalAccuracy;
}

- (double)speed {
    return _location.speed;
}

- (PVAngle *)course {
    PVAngleGeographic * angleGeo = [[PVAngleGeographic alloc] initWithDegrees:_location.course];
    PVAngle * ang = [[PVAngle alloc] initWithAngleGeographic:angleGeo];
    [angleGeo release];
    return [ang autorelease];
}

- (NSDate *)timestamp {
    return _location.timestamp;
}

- (void)dealloc {
    [_location release];
    [super dealloc];
}

@end