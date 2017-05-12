//
//  PVPositionView.m
//  PlanVTT
//
//  Created by Thomas DIER on 19/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVPositionView.h"
#import "PVCoordinates.h"
#import "PVMatrix.h"
#import "PVScreen.h"

@implementation PVPositionView

- (id)initWithCoordinates:(PVCoordinates *)coord andSize:(CGSize)size {
    self = [super initWithFrame:CGRectMake(coord.screen.x, coord.screen.y, size.width, size.height)];
    if (self) {
        self.coordinates = coord;
    }
    return self;
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    self.coordinates = newLocation.coordinates;
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    
}

// en coordonnées relatives à cette UIView !!
- (CGRect)getCenteredCGRectOfSize:(CGSize)size {
    return CGRectMake((self.frame.size.width - size.width)/2,
                      (self.frame.size.height - size.height)/2, 
                      size.width, 
                      size.height);
}

- (void)zoomScaleDidChangeTo:(CGFloat)theScale {
    
}

// coordinates property
- (void)setCoordinates:(PVCoordinates *)coordinates {
    if (coordinates != _coordinates) {
        [_coordinates release];
        _coordinates = [coordinates retain];
        self.centerPoint = coordinates.screen.point;
    }
}
- (PVCoordinates *)coordinates {
    return _coordinates;
}

// centerPoint property
- (void)setCenterPoint:(CGPoint)centerPoint {
    _centerPoint = centerPoint;
    self.frame = CGRectMake(centerPoint.x - self.frame.size.width/2, 
                            centerPoint.y - self.frame.size.height/2, 
                            self.frame.size.width, 
                            self.frame.size.height);
    [self setNeedsDisplay];
}
- (CGPoint)centerPoint {
    return _centerPoint;
}

- (void)dealloc
{
    self.coordinates = nil;
    [super dealloc];
}

@end
