//
//  INDCollectionTimelineMilestoneCellView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTimelineMilestoneCellView.h"

@implementation INDCollectionTimelineMilestoneCellView

- (void)awakeFromNib
{
	[super awakeFromNib];
	self.label.numberOfLines = 0;
	self.label.preferredMaxLayoutWidth = 180.0;
}

@end
