//
//  PVHeadingAwareComponents.h
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVHeading.h"

@protocol PVHeadingAwareComponents <NSObject>

- (void)headingDidChangeTo:(PVHeading *)newHeading;

@end
