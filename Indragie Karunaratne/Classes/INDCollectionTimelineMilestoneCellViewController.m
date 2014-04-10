//
//  INDCollectionTimelineMilestoneCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTimelineMilestoneCellViewController.h"
#import "INDCollectionTimelineMilestoneElement.h"
#import "INDCollectionTimelineMilestoneCellView.h"

@implementation INDCollectionTimelineMilestoneCellViewController

- (void)updateView:(INDCollectionTimelineMilestoneCellView *)view withObject:(INDCollectionTimelineMilestoneElement *)element
{
	view.imageView.image = element.image;
}

@end
