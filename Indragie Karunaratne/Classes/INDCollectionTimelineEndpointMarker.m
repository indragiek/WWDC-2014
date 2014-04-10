//
//  INDCollectionTimelineEndpointMarker.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTimelineEndpointMarker.h"

@implementation INDCollectionTimelineEndpointMarker

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, UIColor.blackColor.CGColor);
    CGContextFillPath(ctx);
}

@end
