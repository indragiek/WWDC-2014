//
//  INDMainViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDMainViewController.h"
#import "INDMainCellViewController.h"
#import "INDMainViewItem.h"

@implementation INDMainViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		[self reloadDataWithJSONFileName:@"main"];
	}
	return self;
}

+ (void)initialize
{
	if (self == INDMainViewController.class) {
		[MNSViewControllerRegistrar registerViewControllerClass:INDMainCellViewController.class forModelClass:INDMainViewItem.class];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UINavigationBar *navigationBar = self.navigationController.navigationBar;
	navigationBar.barTintColor = IND_MAIN_BAR_TINT_COLOR;
	navigationBar.tintColor = IND_MAIN_TINT_COLOR;
	navigationBar.translucent = NO;
	navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : IND_MAIN_TINT_COLOR};
	[self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
