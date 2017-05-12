//
//  PVScreenToGeoTransform.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVScreenToGeoTransform.h"
#import "PVTransform.h"
#import "PVMatrix.h"
#import "PVCoordinates.h"
#import "PVGeographic.h"
#import "PVMeters.h"
#import "PVLongitude.h"
#import "PVLatitude.h"
#import "PVVector.h"
#import "PVScreen.h"

@implementation PVScreenToGeoTransform

static PVScreenToGeoTransform * singleton = nil;

- (id)initByCalculatingFromCoordinates1:(PVCoordinates *)coord1 and2:(PVCoordinates *)coord2 and3:(PVCoordinates *)coord3 {
    
    double x21m = coord2.geographic.longitude.radians - coord1.geographic.longitude.radians;
    double y21m = coord2.geographic.latitude.radians - coord1.geographic.latitude.radians;
    double x32m = coord3.geographic.longitude.radians - coord2.geographic.longitude.radians;
    double y32m = coord3.geographic.latitude.radians - coord2.geographic.latitude.radians;
    
    double x21i = coord2.screen.x - coord1.screen.x;
    double y21i = coord2.screen.y - coord1.screen.y;
    double x32i = coord3.screen.x - coord2.screen.x;
    double y32i = coord3.screen.y - coord2.screen.y;
    
    // On teste si les points sont alignés
    double det = x21i * y32i - y21i * x32i;
    if (det == 0) {
        NSLog(@"Les 3 points sont alignés !");
        return nil;
    }
    
    // On intervertit si x32i > x21i en valeur absolue (c'est pour plus de précision car on divise par x21i, et du coup on est sûr que x21i != 0)
    if (fabs(x32i) > fabs(x21i)) {
        x32i = coord2.screen.x - coord1.screen.x;
        y32i = coord2.screen.y - coord1.screen.y;
        x21i = coord3.screen.x - coord2.screen.x;
        y21i = coord3.screen.y - coord2.screen.y;
        
        x32m = coord2.geographic.longitude.radians - coord1.geographic.longitude.radians;
        y32m = coord2.geographic.latitude.radians - coord1.geographic.latitude.radians;
        x21m = coord3.geographic.longitude.radians - coord2.geographic.longitude.radians;
        y21m = coord3.geographic.latitude.radians - coord2.geographic.latitude.radians;
    }
    
    double denom = y32i * x21i - x32i * y21i;
    double b = ( x32m * x21i - x32i * x21m ) / denom;
    double d = ( y32m * x21i - x32i * y21m ) / denom;
    double a = ( x21m - b * y21i ) / x21i;
    double c = ( y21m - d * y21i ) / x21i;
    
    double e1 = coord1.geographic.longitude.radians - a * coord1.screen.x - b * coord1.screen.y;
    double e2 = coord2.geographic.longitude.radians - a * coord2.screen.x - b * coord2.screen.y;
    double e3 = coord3.geographic.longitude.radians - a * coord3.screen.x - b * coord3.screen.y;
    
    double e = ( e1 + e2 + e3 ) / 3;
    
    double f1 = coord1.geographic.latitude.radians - c * coord1.screen.x - d * coord1.screen.y;
    double f2 = coord2.geographic.latitude.radians - c * coord2.screen.x - d * coord2.screen.y;
    double f3 = coord3.geographic.latitude.radians - c * coord3.screen.x - d * coord3.screen.y;
    
    double f = ( f1 + f2 + f3 ) / 3;
    
    PVMatrix * matrix = [[[PVMatrix alloc] initWithCoefficientsA:a B:b C:c D:d] autorelease];
    PVVector * vec = [[[PVVector alloc] initWithX:e andY:f] autorelease];
    return [self initWithMatrix:matrix andOrigin:vec];
}

+ (void)setupByCalculatingFromCoordinates1:(PVCoordinates *)coord1 and2:(PVCoordinates *)coord2 and3:(PVCoordinates *)coord3 {
    if (singleton == nil) {
        singleton = [[PVScreenToGeoTransform alloc] initByCalculatingFromCoordinates1:coord1 and2:coord2 and3:coord3];
    }
}

+ (PVScreenToGeoTransform *)getInstance {
    return singleton;
}

- (PVGeographic *)geographicForScreen:(PVScreen *)screen {
    PVVector * screenVec = [screen getVectorForCalculation];
    PVVector * geoVec = [[self.matrix applyToVector:screenVec] addToVector:self.origin];
    return [[[PVGeographic alloc] initWithVector:geoVec] autorelease];
}

- (PVScreen *)screenForGeographic:(PVGeographic *)geo {
    PVVector * geoVec = [geo getVectorForCalculation];
    PVVector * oppositeVector = [self.origin getOppositeVector];
    PVVector * differenceVector = [geoVec addToVector:oppositeVector];
    PVMatrix * inverseMat = self.inverseMatrix;
    PVVector * screenVec = [inverseMat applyToVector:differenceVector];
    return [[[PVScreen alloc] initWithVector:screenVec] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVScreenToGeoTransform : %@", [super description]];
}

@end
