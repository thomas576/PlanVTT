//
//  PVHeadingLine.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVHeadingLine.h"
#import "PVPositionTrackingView.h"
#import "PVAngle.h"
#import "PVAngleScreen.h"
#import "PVAngleGeographic.h"
#import "PVAngleMagnetic.h"
#import "PVHeadingLabel.h"

#import "PVConstants.h"

@implementation PVHeadingLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.arrowRadius = [PVConstants redArrowRadius];
        self.backgroundColor = [UIColor clearColor];
        
        //self.label = [[[PVHeadingLabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height/2, 40, 16)] autorelease];
        //[self addSubview:self.label];
        self.label = nil;
        
        PVAngleGeographic * angleGeo = [[PVAngleGeographic alloc] initWithDegrees:0.0];
        self.heading = [[[PVAngle alloc] initWithAngleGeographic:angleGeo] autorelease];
        [angleGeo release];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    float cosHeading = cosf(self.heading.angleScreen.radians);
    float sinHeading = sinf(self.heading.angleScreen.radians);
    
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    // ------------------------ Black straight line ------------------------
    
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.0, 0.0, 0.0, 1.0);
    CGPoint beginPoint = CGPointMake(centerPoint.x + self.arrowRadius * 1.03 * sinHeading, centerPoint.y - self.arrowRadius * 1.03 * cosHeading);
    CGContextMoveToPoint(ctx, beginPoint.x, beginPoint.y);
    float maxRadius = 500.0;//fminf(self.frame.size.width/2, self.frame.size.height/2);
    CGPoint endPoint = CGPointMake(centerPoint.x + maxRadius * sinHeading, centerPoint.y - maxRadius * cosHeading);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    // ------------------------- Red arrow ----------------------------
    
    CGContextSetLineWidth(ctx, 0.5);
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0);
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    float demiAngle = 0.12;
    
    CGPoint firstPoint = CGPointMake(centerPoint.x + self.arrowRadius * 0.25 * sinHeading, centerPoint.y - self.arrowRadius * 0.25 * cosHeading);
    [path moveToPoint:firstPoint];
    
    CGPoint secondPoint = CGPointMake(centerPoint.x + self.arrowRadius * 0.8 * sinf(self.heading.angleScreen.radians - demiAngle), centerPoint.y - self.arrowRadius * 0.8 * cosf(self.heading.angleScreen.radians - demiAngle));
    [path addLineToPoint:secondPoint];
    
    CGPoint thirdPoint = CGPointMake(centerPoint.x + self.arrowRadius * sinHeading, centerPoint.y - self.arrowRadius * cosHeading);
    [path addLineToPoint:thirdPoint];
    
    CGPoint fourthPoint = CGPointMake(centerPoint.x + self.arrowRadius * 0.8 * sinf(self.heading.angleScreen.radians + demiAngle), centerPoint.y - self.arrowRadius * 0.8 * cosf(self.heading.angleScreen.radians + demiAngle));
    [path addLineToPoint:fourthPoint];
    
    [path closePath];
    [path fill];
}

- (void)setNeedsDisplay {
    [super setNeedsDisplay];
    [self.label setNeedsDisplay];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    self.heading = newHeading.heading;
}

// heading property
- (void)setHeading:(PVAngle *)heading {
    if (heading != _heading) {
        [_heading release];
        _heading = [heading retain];
        
        self.label.heading = self.heading;
        
        float cosHeading = cosf(self.heading.angleScreen.radians);
        float sinHeading = sinf(self.heading.angleScreen.radians);
        CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        CGPoint centerProjection = CGPointMake(centerPoint.x + self.arrowRadius * 1.3 * sinHeading, centerPoint.y - self.arrowRadius * 1.3 * cosHeading);
        float offset = 8.0;
        if (self.heading.angleScreen.radians > M_PI) offset = -1 * offset;
        self.label.center = CGPointMake(centerProjection.x - offset * cosHeading, centerProjection.y - offset * sinHeading);
        
        [self setNeedsDisplay];
    }
}
- (PVAngle *)heading {
    return _heading;
}

- (void)dealloc
{
    self.heading = nil;
    self.label = nil;
    [super dealloc];
}

@synthesize arrowRadius = _arrowRadius;
@synthesize label = _label;

@end
