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
#import "INDCollectionButtonElement.h"
#import "INDCollectionButtonCellViewController.h"
#import "INDCollectionVideoElement.h"
#import "INDCollectionVideoCellViewController.h"
#import "MNSViewControllerRegistrar.h"

@implementation INDStaticCollectionViewController

+ (void)initialize
{
	if (self == INDStaticCollectionViewController.class) {
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionImageCellViewController.class forModelClass:INDCollectionImageElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTextCellViewController.class forModelClass:INDCollectionTextElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionButtonCellViewController.class forModelClass:INDCollectionButtonElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionVideoCellViewController.class forModelClass:INDCollectionVideoElement.class];
	}
}

@end
