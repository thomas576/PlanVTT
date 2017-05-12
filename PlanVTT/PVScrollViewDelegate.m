//
//  PVScrollViewDelegate.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVScrollViewDelegate.h"
#import "PVScrollView.h"
#import "PVZoomingView.h"
#import "PVMapView.h"

@implementation PVScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    PVScrollView * scroll = (PVScrollView *)scrollView;
    return scroll.zoomingView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    PVScrollView * scroll = (PVScrollView *)scrollView;
    [scroll zoomScaleDidChangeTo:scroll.zoomScale];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    PVScrollView * scroll = (PVScrollView *)scrollView;
    [scroll zoomScaleDidChangeTo:scale];
}

@end
