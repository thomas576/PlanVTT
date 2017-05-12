//
//  PVGeographic.h
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVLongitude;
@class PVLatitude;
@class PVVector;

@interface PVGeographic : NSObject {
    PVLongitude * _longitude;
    PVLatitude * _latitude;
}

- (id)initWithLongitude:(PVLongitude *)lon andLatitude:(PVLatitude *)lat;
- (id)initWithVector:(PVVector *)vector;

- (PVVector *)getVectorForCalculation;

@property (retain) PVLongitude * longitude;
@property (retain) PVLatitude * latitude;

@end
