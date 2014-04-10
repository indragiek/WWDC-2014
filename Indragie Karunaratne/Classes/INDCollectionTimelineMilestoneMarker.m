//
//  INDCollectionTimelineMilestoneMarker.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTimelineMilestoneMarker.h"

static CGFloat const INDMilestoneMarkerLineWidth = 5.0;

@implementation INDCollectionTimelineMilestoneMarker

- (void)drawRect:(CGRect)rect
{
	const CGFloat r = INDMilestoneMarkerLineWidth;
	CGRect insetRect = CGRectInset(self.bounds, r, r);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextAddEllipseInRect(ctx, insetRect);
	CGContextSetFillColorWithColor(ctx, UIColor.whiteColor.CGColor);
	CGContextFillPath(ctx);
	CGContextAddEllipseInRect(ctx, insetRect);
	CGContextSetLineWidth(ctx, r);
	CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor.CGColor);
	CGContextStrokePath(ctx);
}

@end
