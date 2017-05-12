//
//  PVMapView.m
//  PlanVTT
//
//  Created by Thomas DIER on 17/04/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVMapView.h"
#import "PVConstants.h"

@implementation PVMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CATiledLayer * tempTiledLayer = (CATiledLayer *)self.layer;
        tempTiledLayer.frame = frame;
        tempTiledLayer.levelsOfDetail = [PVConstants levelsOfDetail];
        tempTiledLayer.levelsOfDetailBias = 0;
        tempTiledLayer.bounds = frame;
        self.opaque = YES;
    }
    return self;
}

+ (Class)layerClass
{
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect
{
    NSAutoreleasePool * poolLocationEvent = [[NSAutoreleasePool alloc] init];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat scale = CGContextGetCTM(context).a;
    
    CATiledLayer * tiledLayer = (CATiledLayer *)[self layer];
    CGSize tileSize = tiledLayer.tileSize;// = CGSizeMake(256, 256);
    tileSize.width /= scale;
    tileSize.height /= scale;
    
    int firstCol = floorf(CGRectGetMinX(rect) / tileSize.width);
    int lastCol = floorf((CGRectGetMaxX(rect) - 1) / tileSize.width);
    int firstRow = floorf(CGRectGetMinY(rect) / tileSize.height);
    int lastRow = floorf((CGRectGetMaxY(rect) - 1) / tileSize.height);
    
    for (int row = firstRow; row <= lastRow; row++) {
        for (int col = firstCol; col <= lastCol; col++) {
            UIImage * tile = [self tileForScale:scale row:row col:col];
            CGRect tileRect = CGRectMake(tileSize.width * col, tileSize.height * row,
                                         tileSize.width, tileSize.height);
            
            // if the tile would stick outside of our bounds, we need to truncate it so as to avoid
            // stretching out the partial tiles at the right and bottom edges
            tileRect = CGRectIntersection(self.bounds, tileRect);
            
            [tile drawInRect:tileRect];
            /*
            [[UIColor whiteColor] set];
            CGContextSetLineWidth(context, 6.0 / scale);
            CGContextStrokeRect(context, tileRect);
            */
        }
    }
    
    [super drawRect:rect];
    
    [poolLocationEvent release];
}

- (UIImage *)tileForScale:(CGFloat)scale row:(int)row col:(int)col 
{
    int zoom = [PVConstants getZoomLevelForScale:scale];
    
    NSString * tileName = [NSString stringWithFormat:[PVConstants tilesNameFormatter], zoom, row, col];
    //NSLog(@"scale value = %f loading %@.jpg", scale, tileName);
    
    NSString * directoryName = [PVConstants tilesDirectoryName];
    NSString * path = [[NSBundle mainBundle] pathForResource:tileName ofType:@"jpg" inDirectory:directoryName];
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    return image;
}

- (void)dealloc
{
    [super dealloc];
}

@end
