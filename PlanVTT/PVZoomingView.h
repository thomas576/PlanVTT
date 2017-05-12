//
//  PVZoomingView.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVView.h"
@class PVMapView;
@class PVScrollViewDelegate;
@class PVPositionView;
@class PVCoordinates;
@class PVPositionFixedView;

@interface PVZoomingView : PVView {
    PVMapView * _mapView;
    PVPositionFixedView * _positionFixedView;
}

- (id)initWithFrame:(CGRect)frame andCoordinates:(PVCoordinates *)coord;

@property (retain) PVMapView * mapView;
@property (retain) PVPositionFixedView * positionFixedView;

@end
