//
//  PVAngle.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVAngleScreen;
@class PVAngleMagnetic;
@class PVAngleGeographic;
@class PVAngleGeoToScreenTransform;
@class PVAngleMagToGeoTransform;

@interface PVAngle : NSObject {
    PVAngleGeographic * _angleGeographic;
    PVAngleMagnetic * _angleMagnetic;
    PVAngleScreen * _angleScreen;
}

- (id)initWithAngleGeographic:(PVAngleGeographic *)angleGeo andMagnetic:(PVAngleMagnetic *)angleMag andScreen:(PVAngleScreen *)angleScreen;
- (id)initWithAngleGeographic:(PVAngleGeographic *)angleGeo;
- (id)initWithAngleMagnetic:(PVAngleMagnetic *)angleMag;
- (id)initWithAngleScreen:(PVAngleScreen *)angleScreen;

@property (retain) PVAngleGeographic * angleGeographic;
@property (retain) PVAngleMagnetic * angleMagnetic;
@property (retain) PVAngleScreen * angleScreen;

@end
