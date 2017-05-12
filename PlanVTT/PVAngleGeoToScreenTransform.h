//
//  PVAngleGeoToScreenTransform.h
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVAngleScreen;
@class PVAngleGeographic;
@class PVCoordinates;
@class PVMatrix;
@class PVScreenToGeoTransform;

@interface PVAngleGeoToScreenTransform : NSObject {
    PVAngleGeographic * _rotationToAddToGeo;
}

- (id)init;

+ (void)setup;
+ (PVAngleGeoToScreenTransform *)getInstance;

- (PVAngleScreen *)angleScreenForGeographic:(PVAngleGeographic *)angleGeo;
- (PVAngleGeographic *)angleGeoForScreen:(PVAngleScreen *)angleScreen;

@property (retain) PVAngleGeographic * rotationToAddToGeo;

@end
