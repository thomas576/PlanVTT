//
//  PVRangeCircle.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVRangeCircle.h"
#import "PVCoordinates.h"
#import "PVScreen.h"
#import "PVMeters.h"

@implementation PVRangeCircle

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _ranges = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:500.0],
                                                   [NSNumber numberWithDouble:1000.0],
                                                   [NSNumber numberWithDouble:2000.0],
                                                   [NSNumber numberWithDouble:5000.0], nil];
        self.coordinates = coord;
        _calculatedRanges = [[NSMutableArray alloc] initWithCapacity:[_ranges count]];
        [self calculateRangesOnScreen];
    }
    return self;
}

- (void)calculateRangesOnScreen {
    for (NSNumber * number in self.ranges) {
        PVMeters * distantMeters = [[PVMeters alloc] initWithX:(self.coordinates.meters.x + [number doubleValue]) andY:self.coordinates.meters.y];
        
        PVCoordinates * distantCoordinates = [[PVCoordinates alloc] initWithMeters:distantMeters];
        
        [_calculatedRanges addObject:[NSNumber numberWithDouble:hypot(distantCoordinates.screen.x - self.coordinates.screen.x, distantCoordinates.screen.y - self.coordinates.screen.y)]];
        
        [distantCoordinates release];
        [distantMeters release];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (NSNumber * number in _calculatedRanges) {
        float diameter = [number floatValue] * 2.0;
        
        CGContextSetLineWidth(ctx, 2.0);
        CGFloat array[2] = {4.0, 1.0};
        CGContextSetLineDash(ctx, 0.0, array, 2);
        CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1.0);
        CGRect rec = [self getCenteredCGRectOfSize:CGSizeMake(diameter, diameter)];
        CGContextStrokeEllipseInRect(ctx, rec);
    }
}

// en coordonnées relatives à cette UIView !!
- (CGRect)getCenteredCGRectOfSize:(CGSize)size {
    return CGRectMake((self.frame.size.width - size.width)/2,
                      (self.frame.size.height - size.height)/2, 
                      size.width, 
                      size.height);
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    self.coordinates = newLocation.coordinates;
}

- (void)dealloc
{
    self.ranges = nil;
    self.coordinates = nil;
    [_calculatedRanges release];
    [super dealloc];
}

@synthesize ranges = _ranges;
@synthesize coordinates = _coordinates;

@end
