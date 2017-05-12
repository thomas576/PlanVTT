//
//  PVScreenToGeoTransform.h
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
@class PVMeters;
@class PVLongitude;
@class PVLatitude;
@class PVVector;
@class PVScreen;

@interface PVScreenToGeoTransform : PVTransform {
    
}

- (id)initByCalculatingFromCoordinates1:(PVCoordinates *)coord1 and2:(PVCoordinates *)coord2 and3:(PVCoordinates *)coord3;

+ (void)setupByCalculatingFromCoordinates1:(PVCoordinates *)coord1 and2:(PVCoordinates *)coord2 and3:(PVCoordinates *)coord3;

+ (PVScreenToGeoTransform *)getInstance;

- (PVGeographic *)geographicForScreen:(PVScreen *)screen;
- (PVScreen *)screenForGeographic:(PVGeographic *)geo;

@end
