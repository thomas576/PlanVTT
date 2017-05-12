//
//  PVHeadingLabel.h
//  PlanVTT
//
//  Created by Thomas DIER on 21/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVAngle;
@class PVAngleScreen;

@interface PVHeadingLabel : UILabel {
    PVAngle * _heading;
}

@property (retain) PVAngle * heading;

@end
