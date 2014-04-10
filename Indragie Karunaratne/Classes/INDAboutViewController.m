//
//  INDAboutViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDAboutViewController.h"
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

@implementation INDAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		[self reloadDataWithJSONFileName:@"about"];
	}
	return self;
}

+ (void)initialize
{
	if (self == INDAboutViewController.class) {
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionImageCellViewController.class forModelClass:INDCollectionImageElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTextCellViewController.class forModelClass:INDCollectionTextElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineHeaderViewController.class forModelClass:INDCollectionTimelineHeaderElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineFooterViewController.class forModelClass:INDCollectionTimelineFooterElement.class];
		[MNSViewControllerRegistrar registerViewControllerClass:INDCollectionTimelineMilestoneCellViewController.class forModelClass:INDCollectionTimelineMilestoneElement.class];
	}
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	UINavigationBar *navigationBar = self.navigationController.navigationBar;
	[UIView animateWithDuration:IND_TRANSITION_ANIMATION_DURATION animations:^{
		navigationBar.tintColor = nil;
		navigationBar.barTintColor = nil;
		navigationBar.barStyle = UIBarStyleDefault;
		navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : IND_ABOUT_TITLE_COLOR};
	}];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.title = @"About Me";
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
