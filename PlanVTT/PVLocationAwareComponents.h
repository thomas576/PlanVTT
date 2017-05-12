//
//  PVLocationAwareComponents.h
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVLocation.h"

@protocol PVLocationAwareComponents <NSObject>

- (void)locationDidChangeTo:(PVLocation *)newLocation;

@end
