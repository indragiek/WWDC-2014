//
//  INDMainCellView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDMainCellView.h"

@implementation INDMainCellView

- (void)awakeFromNib
{
	[super awakeFromNib];
	self.descriptionLabel.numberOfLines = 0;
	self.descriptionLabel.ind_lineSpacing = IND_MAIN_DESCRIPTION_LINE_SPACING;
}

@end
