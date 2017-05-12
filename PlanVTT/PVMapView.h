//
//  PVMapView.h
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PVMapView : UIView {
    
}

- (UIImage *)tileForScale:(CGFloat)scale row:(int)row col:(int)col;

@end
