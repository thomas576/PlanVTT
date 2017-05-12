//
//  PVGeoToMetersTransform.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVTransform.h"
@class PVMatrix;
@class PVCoordinates;
@class PVGeographic;
@class PVVector;
@class PVMeters;
@class PVLongitude;
@class PVLatitude;

@class PVConstants;

@interface PVGeoToMetersTransform : PVTransform {
    
}

- (id)initByCalculatingFromOriginWithItsCoordinates:(PVCoordinates *)coord;

+ (void)setupByCalculatingFromOriginWithItsCoordinates:(PVCoordinates *)coord;
+ (PVGeoToMetersTransform *)getInstance;

- (PVMeters *)metersForGeographic:(PVGeographic *)geo;
- (PVGeographic *)geographicForMeters:(PVMeters *)meters;

@end
