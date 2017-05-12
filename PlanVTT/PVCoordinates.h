//
//  PVCoordinates.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVMatrix;
@class PVGeographic;
@class PVMeters;
@class PVGeoToMetersTransform;
@class PVScreenToGeoTransform;
@class PVScreen;

@interface PVCoordinates : NSObject {
    PVGeographic * _geographic;
    PVMeters * _meters;
    PVScreen * _screen;
}

- (id)initWithGeographic:(PVGeographic *)geo andMeters:(PVMeters *)meters andScreen:(PVScreen *)screen;
- (id)initWithGeographic:(PVGeographic *)geo;
- (id)initWithMeters:(PVMeters *)meters;
- (id)initWithScreen:(PVScreen *)screen;

- (CGPoint)screenCoordinatesWithScale:(float)scale;

@property (retain) PVGeographic * geographic;
@property (retain) PVMeters * meters;
@property (retain) PVScreen * screen;

@end
