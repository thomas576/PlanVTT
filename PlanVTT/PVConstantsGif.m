//
//  PVConstantsGif.m
//  PlanVTT
//
//  Created by Thomas Dier on 16/09/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVConstantsGif.h"
#import "PVConstants.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVAngle.h"
#import "PVScreen.h"
#import "PVAngleGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

@implementation PVConstantsGif

- (float)mapWidth {
    float val = 7000;
    return val;
}
- (float)mapHeight {
    float val = 4496;
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
    int val = 4;
    return val;
}

- (PVCoordinates *)coordinatesPoint1 {
    // CEA
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:8.0 secondes:55.4291];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:42.0 secondes:38.0376];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:3810.5 andY:2284.4];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint2 {
    // Pylone
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:9.0 secondes:47.6311];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:45.0 secondes:2.7739];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:4366.2 andY:57.3];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint3 {
    // bne 157
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:5.0 secondes:21.4630];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:44.0 secondes:14.7519];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:1532.1 andY:794.3];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (int)getZoomLevelForScale:(CGFloat)scale {
    int zoom = (int)(scale * 1000);
    if (zoom < 125) { zoom = 125; } else if (zoom > 1000) { zoom = 1000; }
    return zoom;
}
- (NSString *)tilesDirectoryName {
    return @"plan-gif";
}
- (NSString *)tilesNameFormatter {
    return @"plan-gif-%d_%d_%d";
}

@end
