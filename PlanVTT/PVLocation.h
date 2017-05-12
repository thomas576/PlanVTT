//
//  PVLocation.h
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVCoordinates;
@class PVMatrix;
@class PVGeographic;
@class PVMeters;
@class PVGeoToMetersTransform;
@class PVScreenToGeoTransform;
@class PVScreen;
@class PVAngle;

@interface PVLocation : NSObject {
    CLLocation * _location;
}

- (id)initWithLocation:(CLLocation *)loc;

- (NSString *)getLongitudeDescription;
- (NSString *)getLatitudeDescription;
- (NSString *)getPrecisionDescription;
- (NSString *)getAltitudeDescription;
- (NSString *)getSpeedDescription;
- (NSString *)getCourseDescription;

@property (readonly) PVCoordinates * coordinates;
@property (readonly) double altitude;
@property (readonly) double verticalAccuracy;
@property (readonly) double horizontalAccuracy;
@property (readonly) double speed;
@property (readonly) PVAngle * course;
@property (readonly) NSDate * timestamp;

@end
