//
//  PVConstantsRombas.m
//  PlanVTT
//
//  Created by Thomas Dier on 16/09/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVConstantsRombas.h"
#import "PVConstants.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVAngle.h"
#import "PVScreen.h"
#import "PVAngleGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

@implementation PVConstantsRombas

- (float)mapWidth {
    float val = 4624;
    return val;
}
- (float)mapHeight {
    float val = 2600;
    return val;
}

- (float)minimumZoomScale {
    float val = 0.0625;
    return val;
}
- (float)maximumZoomScale {
    float val = 2.0;
    return val;
}
- (int)levelsOfDetail {
    int val = 3;
    return val;
}

- (PVCoordinates *)coordinatesPoint1 {
    // bne 232
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:5.0 minutes:57.0 secondes:18.8705];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:13.0 secondes:23.8606];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:727.5 andY:1178.8];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint2 {
    // bne 329
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:3.0 secondes:57.8756];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:14.0 secondes:42.7815];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:2850.8 andY:569.0];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint3 {
    // bne 337
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:6.0 secondes:58.3672];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:11.0 secondes:54.3099];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:3811.3 andY:1871.3];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (int)getZoomLevelForScale:(CGFloat)scale {
    int zoom = (int)(scale * 1000);
    if (zoom < 250) { zoom = 250; } else if (zoom > 1000) { zoom = 1000; }
    return zoom;
}
- (NSString *)tilesDirectoryName {
    return @"plan-rombas";
}
- (NSString *)tilesNameFormatter {
    return @"plan-rombas_%d_%d_%d";
}

@end
