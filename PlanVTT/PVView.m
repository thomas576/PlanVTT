//
//  PVView.m
//  PlanVTT
//
//  Created by Thomas Dier on 06/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVView.h"


@implementation PVView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    
}

- (void)dealloc
{
    [super dealloc];
}

@end
