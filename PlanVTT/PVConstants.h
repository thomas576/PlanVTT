//
//  PVConstants.h
//  PlanVTT
//
//  Created by Thomas DIER on 21/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVCoordinates;
@class PVAngle;
@class PVScreen;
@class PVMeters;
@class PVGeographic;
@class PVAngleGeographic;
@class PVLongitude;
@class PVLatitude;

@class PVConstantsStQuentin;
@class PVConstantsRombas;

@interface PVConstants : NSObject {
    
}

+ (PVConstants *)getInstance;

// Méthodes statiques d'accès aux propriétés

+ (double)earthPolarRadius;
+ (double)earthEquatorialRadius;

+ (float)mapWidth;
+ (float)mapHeight;

+ (float)minimumZoomScale;
+ (float)maximumZoomScale;
+ (int)levelsOfDetail;

+ (double)minimumDistanceFilter;
+ (double)minimumHeadingFilter;

+ (PVCoordinates *)coordinatesPoint1;
+ (PVCoordinates *)coordinatesPoint2;
+ (PVCoordinates *)coordinatesPoint3;

+ (PVAngleGeographic *)magneticDeclination;

+ (int)getZoomLevelForScale:(CGFloat)scale;
+ (NSString *)tilesDirectoryName;
+ (NSString *)tilesNameFormatter;

+ (float)redArrowRadius;
+ (float)trackingDotDiameter;

// Méthodes d'instance correspondantes

- (double)earthPolarRadius;
- (double)earthEquatorialRadius;

- (float)mapWidth;
- (float)mapHeight;

- (float)minimumZoomScale;
- (float)maximumZoomScale;
- (int)levelsOfDetail;

- (double)minimumDistanceFilter;
- (double)minimumHeadingFilter;

- (PVCoordinates *)coordinatesPoint1;
- (PVCoordinates *)coordinatesPoint2;
- (PVCoordinates *)coordinatesPoint3;

- (PVAngleGeographic *)magneticDeclination;

- (int)getZoomLevelForScale:(CGFloat)scale;
- (NSString *)tilesDirectoryName;
- (NSString *)tilesNameFormatter;

- (float)redArrowRadius;
- (float)trackingDotDiameter;

@end