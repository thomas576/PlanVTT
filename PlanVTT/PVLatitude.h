//
//  PVLatitude.h
//  PlanVTT
//
//  Created by Thomas DIER on 23/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVSuperAngle.h"

@interface PVLatitude : PVSuperAngle {
    
}

- (id)initWithNorS:(NSString *)letter andDegrees:(double)deg minutes:(double)min secondes:(double)sec;

- (NSString *)getLetterNorS;

- (NSString *)getStandardGPSRepresentation;

@end
