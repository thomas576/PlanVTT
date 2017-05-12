//
//  PVHeading.h
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVAngle;

@interface PVHeading : NSObject {
    PVAngle * _heading;
    double headingAccuracy;
}

- (id)initWithAngle:(PVAngle *)angle andAccuracy:(double)accuracy;
- (id)initWithHeading:(CLHeading *)head;

- (NSString *)getHeadingDescription;

@property (readonly) PVAngle * heading;
@property (assign) double headingAccuracy;

@end
