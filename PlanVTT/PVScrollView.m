//
//  PVScrollView.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVScrollView.h"
#import "PVZoomingView.h"
#import "PVNonZoomingView.h"
#import "PVScrollViewDelegate.h"
#import "PVGeoToMetersTransform.h"
#import "PVScreenToGeoTransform.h"
#import "PVCoordinates.h"
#import "PVScreen.h"
#import "PVGeographic.h"
#import "PVAngle.h"
#import "PVLongitude.h"
#import "PVLatitude.h"
#import "PVAngleGeoToScreenTransform.h"
#import "PVAngleMagToGeoTransform.h"
#import "PVLocation.h"
#import "PVHeading.h"
#import "PVLocationController.h"

#import "PVConstants.h"

@implementation PVScrollView

- (void)awakeFromNib {
    self.delegate = [[PVScrollViewDelegate alloc] init];
    
    self.minimumZoomScale = [PVConstants minimumZoomScale];
    self.maximumZoomScale = [PVConstants maximumZoomScale];
    self.contentSize = CGSizeMake([PVConstants mapWidth], [PVConstants mapHeight]);
    self.pagingEnabled = NO;

    // Ask for notifications
    [[PVLocationController getInstance] addNotifiedComponent:self];
    
    // Initialisation des transformations
    [PVScreenToGeoTransform setupByCalculatingFromCoordinates1:[PVConstants coordinatesPoint1] and2:[PVConstants coordinatesPoint2] and3:[PVConstants coordinatesPoint3]];
    //NSLog(@"%@", [PVScreenToGeoTransform getInstance]);
    [PVGeoToMetersTransform setupByCalculatingFromOriginWithItsCoordinates:[PVConstants coordinatesPoint1]];
    //NSLog(@"%@", [PVGeoToMetersTransform getInstance]);
    [PVAngleGeoToScreenTransform setup];
    //NSLog(@"%@", [PVAngleGeoToScreenTransform getInstance]);
    [PVAngleMagToGeoTransform setupWithDeclinaison:[PVConstants magneticDeclination]];
    //NSLog(@"%@", [PVAngleMagToGeoTransform getInstance]);
    
    // Coordonées initiales
    PVCoordinates * currentCoordinates = [PVConstants coordinatesPoint1];
    
    _zoomingView = [[PVZoomingView alloc] initWithFrame:CGRectMake(0, 0, [PVConstants mapWidth], [PVConstants mapHeight]) andCoordinates:currentCoordinates];
    [self addSubview:self.zoomingView];
    
    _nonZoomingView = [[PVNonZoomingView alloc] initWithFrame:self.frame andCoordinates:currentCoordinates];
    [self addSubview:self.nonZoomingView];
    
    self.zoomScale = 0.125;
}

- (void)layoutSubviews 
{
    [super layoutSubviews];
    
    // center the image as it becomes smaller than the size of the screen
    
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = self.zoomingView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    } else {
        frameToCenter.origin.x = 0;
    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    } else {
        frameToCenter.origin.y = 0;
    }
    
    self.zoomingView.frame = frameToCenter;
    self.nonZoomingView.frame = frameToCenter;
    
    //self.zoomingView.contentScaleFactor = 1.0;
}

- (void)zoomScaleDidChangeTo:(CGFloat)theScale {
    [self.nonZoomingView zoomScaleDidChangeTo:theScale];
}

- (void)locationDidChangeTo:(PVLocation *)newLocation {
    [self.nonZoomingView locationDidChangeTo:newLocation];
    [self.zoomingView locationDidChangeTo:newLocation];
}

- (void)headingDidChangeTo:(PVHeading *)newHeading {
    [self.nonZoomingView headingDidChangeTo:newHeading];
    [self.zoomingView headingDidChangeTo:newHeading];
}

/*
- (void)test {
    PVLongitude * lon = [[PVLongitude alloc] initWithEorW:@"E" andDegrees:6.0 minutes:7.0 secondes:20.98];
    PVLatitude * lat = [[PVLatitude alloc] initWithNorS:@"N" andDegrees:49.0 minutes:6.0 secondes:58.15];
    PVLocation * loc = [[PVLocation alloc] initWithLocation:[[CLLocation alloc] initWithLatitude:lat.degrees longitude:lon.degrees]];
    [lat release];
    [lon release];
    
    [self locationDidChangeTo:loc];
    [loc release];
    
    PVHeading * head = [[PVHeading alloc] initWithHeading:[[CLHeading alloc] init]];
    [self headingDidChangeTo:head];
}
*/

- (void)dealloc {
    [[PVLocationController getInstance] removeNotifiedComponent:self];
    self.nonZoomingView = nil;
    self.zoomingView = nil;
    [self.delegate release];
    [super dealloc];
}

@synthesize nonZoomingView = _nonZoomingView;
@synthesize zoomingView = _zoomingView;

@end
