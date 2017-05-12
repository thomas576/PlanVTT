//
//  PVTransform.h
//  PlanVTT
//
//  Created by Thomas DIER on 20/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVMatrix;
@class PVCoordinates;
@class PVGeographic;
@class PVMeters;
@class PVVector;

@interface PVTransform : NSObject {
    PVMatrix * _matrix;
    PVVector * _origin;
    
    PVMatrix * _inverseMatrix;
}

- (id)initWithMatrix:(PVMatrix *)matrix andOrigin:(PVVector *)origin;

@property (retain) PVMatrix * matrix;
@property (retain) PVVector * origin;
@property (readonly) PVMatrix * inverseMatrix;

@end
