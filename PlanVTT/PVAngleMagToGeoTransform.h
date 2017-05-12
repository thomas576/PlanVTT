//
//  PVAngleMagToGeoTransform.h
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVAngleMagnetic;
@class PVAngleGeographic;

@class PVConstants;

@interface PVAngleMagToGeoTransform : NSObject {
    PVAngleGeographic * _declinaison;
}

- (id)initWithDeclinaison:(PVAngleGeographic *)dec;

+ (void)setupWithDeclinaison:(PVAngleGeographic *)dec;
+ (PVAngleMagToGeoTransform *)getInstance;

- (PVAngleGeographic *)angleGeoForMagnetic:(PVAngleMagnetic *)angMag;
- (PVAngleMagnetic *)angleMagForGeographic:(PVAngleGeographic *)angGeo;

@property (retain) PVAngleGeographic * declinaison;

@end
