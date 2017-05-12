//
//  PVConstants.m
//  PlanVTT
//
//  Created by Thomas DIER on 21/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVConstants.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVAngle.h"
#import "PVScreen.h"
#import "PVAngleGeographic.h"
#import "PVLongitude.h"
#import "PVLatitude.h"

#import "PVConstantsStQuentin.h"
#import "PVConstantsRombas.h"
#import "PVConstantsGif.h"
#import "PVConstantsEssonne.h"

@implementation PVConstants

static PVConstants * singleton = nil;

+ (PVConstants *)getInstance {
    if (singleton == nil) {
        singleton = [[PVConstantsStQuentin alloc] init];
    }
    return singleton;
}

+ (double)earthPolarRadius {
    return [[self getInstance] earthPolarRadius];
}
+ (double)earthEquatorialRadius {
    return [[self getInstance] earthEquatorialRadius];
}

+ (float)mapWidth {
    return [[self getInstance] mapWidth];
}
+ (float)mapHeight {
    return [[self getInstance] mapHeight];
}

+ (float)minimumZoomScale {
    return [[self getInstance] minimumZoomScale];
}
+ (float)maximumZoomScale {
    return [[self getInstance] maximumZoomScale];
}
+ (int)levelsOfDetail {
    return [[self getInstance] levelsOfDetail];
}

+ (double)minimumDistanceFilter {
    return [[self getInstance] minimumDistanceFilter];
}
+ (double)minimumHeadingFilter {
    return [[self getInstance] minimumHeadingFilter];
}

+ (PVCoordinates *)coordinatesPoint1 {
    return [[self getInstance] coordinatesPoint1];
}

+ (PVCoordinates *)coordinatesPoint2 {
    return [[self getInstance] coordinatesPoint2];
}

+ (PVCoordinates *)coordinatesPoint3 {
    return [[self getInstance] coordinatesPoint3];
}

+ (PVAngleGeographic *)magneticDeclination {
    return [[self getInstance] magneticDeclination];
}

+ (int)getZoomLevelForScale:(CGFloat)scale {
    return [[self getInstance] getZoomLevelForScale:scale];
}
+ (NSString *)tilesDirectoryName {
    return [[self getInstance] tilesDirectoryName];
}
+ (NSString *)tilesNameFormatter {
    return [[self getInstance] tilesNameFormatter];
}

+ (float)redArrowRadius {
    return [[self getInstance] redArrowRadius];
}
+ (float)trackingDotDiameter {
    return [[self getInstance] trackingDotDiameter];
}

- (double)earthPolarRadius {
    double val = 6356752.3142; // in meters
    return val;
}
- (double)earthEquatorialRadius {
    double val = 6378137.0; // in meters
    return val;
}

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
    int val = 4;
    return val;
}

- (double)minimumDistanceFilter {
    double val = 5.0; // en metres
    return val;
}
- (double)minimumHeadingFilter {
    double val = 3.0; // en degres
    return val;
}

- (PVCoordinates *)coordinatesPoint1 {
    // bne 344
    PVLongitude * longitude = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:6.0 secondes:5.7455];
    PVLatitude * latitude = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:8.0 secondes:10.4404];
    PVGeographic * geo = [[PVGeographic alloc] initWithLongitude:longitude andLatitude:latitude];
    [longitude release];
    [latitude release];
    
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
    
    PVScreen * screen = [[PVScreen alloc] initWithX:1099.8 andY:3183.9];
    PVMeters * meters = [[PVMeters alloc] initWithX:0.0 andY:0.0];
    
    PVCoordinates * coord = [[[PVCoordinates alloc] initWithGeographic:geo andMeters:meters andScreen:screen] autorelease];
    
    [geo release];
    [screen release];
    [meters release];
    return coord;
}

- (PVAngleGeographic *)magneticDeclination {
    // 0°42' E à Metz 2011
    return [[[PVAngleGeographic alloc] initWithDegrees:(42.0/60.0)] autorelease];
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

- (float)redArrowRadius {
    float radius = 55.0;
    return radius;
}
- (float)trackingDotDiameter {
    float diameter = 15.0;
    return diameter;
}

@end
