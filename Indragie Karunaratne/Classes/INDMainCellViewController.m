//
//  INDMainCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDMainCellViewController.h"
#import "INDMainCellView.h"
#import "INDMainViewItem.h"

@implementation INDMainCellViewController

- (void)updateView:(INDMainCellView *)view withObject:(INDMainViewItem *)item
{
	view.backgroundImageView.image = item.backgroundImage;
	view.iconImageView.image = item.iconImage;
	view.titleLabel.text = item.title;
	view.descriptionLabel.text = item.projectDescription;
}

- (void)selectObject:(INDMainViewItem *)item
{
	
}

@end
