//
//  PVHeadingLabel.m
//  PlanVTT
//
//  Created by Thomas DIER on 21/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVHeadingLabel.h"
#import "PVAngle.h"
#import "PVAngleScreen.h"

@implementation PVHeadingLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont systemFontOfSize:12.0];
        self.heading = [[[PVAngle alloc] initWithAngleGeographic:nil andMagnetic:nil andScreen:[[[PVAngleScreen alloc] initWithDegrees:90.0] autorelease]] autorelease];
        //self.layer.anchorPoint = CGPointMake(0, 0);
        self.textAlignment = UITextAlignmentCenter;
    }
    return self;
}

// heading property
- (void)setHeading:(PVAngle *)heading {
    if (heading != _heading) {
        [_heading release];
        _heading = [heading retain];
        
        NSString * textBrut = [NSString stringWithFormat:@"%d°", (int)self.heading.angleScreen.degrees];
        int length = [textBrut length];
        NSString * textAvecZeros;
        if (length == 4) {
            textAvecZeros = textBrut;
        } else if (length == 3) {
            textAvecZeros = [NSString stringWithFormat:@"0%@", textBrut];
        } else {
            textAvecZeros = [NSString stringWithFormat:@"00%@", textBrut];
        }
        self.text = textAvecZeros;
        self.transform = CGAffineTransformMakeRotation(fmod(self.heading.angleScreen.radians, M_PI) - M_PI/2);
        
        [self setNeedsDisplay];
    }
}
- (PVAngle *)heading {
    return _heading;
}

@end
