//
//  PVTrackingDot.m
//  PlanVTT
//
//  Created by Thomas DIER on 18/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVTrackingDot.h"
#import "PVPositionTrackingView.h"

@implementation PVTrackingDot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _trackingDotImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tracking-dot" ofType:@"png"]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self.trackingDotImage drawInRect:rect];
}

- (void)dealloc
{
    [super dealloc];
}

@synthesize trackingDotImage = _trackingDotImage;

@end
