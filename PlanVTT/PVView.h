//
//  PVView.h
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"

@interface PVView : UIView <PVLocationAwareComponents, PVHeadingAwareComponents> {
    
}

- (void)locationDidChangeTo:(PVLocation *)newLocation;
- (void)headingDidChangeTo:(PVHeading *)newHeading;

@end
