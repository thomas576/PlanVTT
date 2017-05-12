//
//  PVAngleGeoToScreenTransform.m
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVAngleGeoToScreenTransform.h"
#import "PVAngleScreen.h"
#import "PVAngleGeographic.h"
#import "PVCoordinates.h"
#import "PVMatrix.h"
#import "PVScreenToGeoTransform.h"

@implementation PVAngleGeoToScreenTransform

static PVAngleGeoToScreenTransform * singleton = nil;

- (id)init {
    self = [super init];
    if (self) {
        PVMatrix * matrix = [PVScreenToGeoTransform getInstance].matrix;
        
        /*
        double theta = acos( matrix.a / hypot(matrix.a, matrix.c) );
        if (matrix.b < 0) theta = -1 * theta;
         */
        
        /*
        double theta = acos( fabs(matrix.a) * hypot(matrix.c, matrix.d) / fabs([matrix determinant]) );
        if (matrix.c < 0) theta = -1 * theta;
         */
        
        double theta = fabs(atan( -1 * matrix.c / matrix.d ));
        if (matrix.c < 0) theta = -1 * theta;
        
        //NSLog(@"theta = %g rad", theta);
        _rotationToAddToGeo = [[PVAngleGeographic alloc] initWithRadians:theta];
    }
    return self;
}

+ (void)setup {
    if (singleton == nil) {
        singleton = [[PVAngleGeoToScreenTransform alloc] init];
    }
}

+ (PVAngleGeoToScreenTransform *)getInstance {
    return singleton;
}

- (PVAngleScreen *)angleScreenForGeographic:(PVAngleGeographic *)angleGeo {
    return [[[PVAngleScreen alloc] initWithRadians:(angleGeo.radians + self.rotationToAddToGeo.radians)] autorelease];
}

- (PVAngleGeographic *)angleGeoForScreen:(PVAngleScreen *)angleScreen {
    return [[[PVAngleGeographic alloc] initWithRadians:(angleScreen.radians - self.rotationToAddToGeo.radians)] autorelease];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PVAngleGeoToScreenTransform : rotationToAddToGeo = %@ ;\n(rotationToAddToGeo est l'angle géographique qu'il faut ajouter à la direction géographique pour obtenir l'angle sur l'écran)", self.rotationToAddToGeo];
}

@synthesize rotationToAddToGeo = _rotationToAddToGeo;

@end
