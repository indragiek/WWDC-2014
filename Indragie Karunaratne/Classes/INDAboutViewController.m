//
//  INDAboutViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDAboutViewController.h"

@implementation INDAboutViewController

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
