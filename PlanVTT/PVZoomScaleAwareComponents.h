//
//  PVZoomScaleAwareComponents.h
//  PlanVTT
//
//  Created by Thomas DIER on 18/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PVZoomScaleAwareComponents <NSObject>

- (void)zoomScaleDidChangeTo:(CGFloat)theScale;

@end
