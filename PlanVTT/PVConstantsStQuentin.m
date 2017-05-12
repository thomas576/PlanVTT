//
//  PVConstantsStQuentin.m
//  PlanVTT
//
//  Created by Thomas DIER on 21/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVConstantsStQuentin.h"
#import "PVConstants.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVAngle.h"
#import "PVScreen.h"
#import "PVAngleGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

@implementation PVConstantsStQuentin

- (float)mapWidth {
    float val = 5376;
    return val;
}
- (float)mapHeight {
    float val = 7760;
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
    // bne 344
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:6.0 secondes:5.7455];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:8.0 secondes:10.4404];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    //PVScreen * screen = [[PVScreen alloc] initWithX:1260.5 andY:1696.1];
    PVScreen * screen = [[PVScreen alloc] initWithX:2771.6 andY:3445.0];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint2 {
    // bne 343
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:3.0 secondes:35.9299];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:6.0 secondes:58.1644];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    //PVScreen * screen = [[PVScreen alloc] initWithX:463.3 andY:2254.5];
    PVScreen * screen = [[PVScreen alloc] initWithX:1177.0 andY:4562.0];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVCoordinates *)coordinatesPoint3 {
    // bne 338
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:3.0 secondes:28.6996];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:8.0 secondes:27.3260];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
    //PVScreen * screen = [[PVScreen alloc] initWithX:424.5 andY:1565.5];
    PVScreen * screen = [[PVScreen alloc] initWithX:1099.8 andY:3183.9];
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
    return @"plan-st-quentin";
}
- (NSString *)tilesNameFormatter {
    return @"plan-st-quentin-%d_%d_%d";
}

@end
