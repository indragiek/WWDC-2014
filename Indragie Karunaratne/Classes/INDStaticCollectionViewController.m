//
//  INDStaticCollectionViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDStaticCollectionViewController.h"
#import "INDCollectionImageElement.h"
#import "INDCollectionImageCellViewController.h"
#import "INDCollectionTextElement.h"
#import "INDCollectionTextCellViewController.h"
#import "INDCollectionTimelineHeaderElement.h"
#import "INDCollectionTimelineHeaderViewController.h"
#import "INDCollectionTimelineFooterElement.h"
#import "INDCollectionTimelineFooterViewController.h"
#import "INDCollectionTimelineMilestoneElement.h"
#import "INDCollectionTimelineMilestoneCellViewController.h"
#import "MNSViewControllerRegistrar.h"

@implementation INDStaticCollectionViewController

+ (void)initialize
{
	if (self == INDStaticCollectionViewController.class) {
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionImageCellViewController.class forModelClass:INDCollectionImageElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTextCellViewController.class forModelClass:INDCollectionTextElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineHeaderViewController.class forModelClass:INDCollectionTimelineHeaderElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineFooterViewController.class forModelClass:INDCollectionTimelineFooterElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineMilestoneCellViewController.class forModelClass:INDCollectionTimelineMilestoneElement.class];
	}
}

@end
