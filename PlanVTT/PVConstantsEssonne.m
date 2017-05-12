//
//  PVConstantsEssonne.m
//  PlanVTT
//
//  Created by Thomas Dier on 17/09/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVConstantsEssonne.h"
#import "PVConstants.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVAngle.h"
#import "PVScreen.h"
#import "PVAngleGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

@implementation PVConstantsEssonne

- (float)mapWidth {
    float val = 6600;
    return val;
}
- (float)mapHeight {
    float val = 5612;
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
    // CEA
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:8.0 secondes:55.4291];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:42.0 secondes:38.0376];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:3817.0 andY:3031.2];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint2 {
    // rep 177
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:5.0 secondes:15.8411];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:47.0 secondes:21.2486];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:2387.9 andY:353.3];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint3 {
    // golf
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:2.0 minutes:12.0 secondes:9.9686];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:48.0 minutes:45.0 secondes:52.0000];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    PVScreen * screen = [[PVScreen alloc] initWithX:5083.2 andY:1197.0];
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
    return @"plan-essonne";
}
- (NSString *)tilesNameFormatter {
    return @"plan-essonne-%d_%d_%d";
}

@end
