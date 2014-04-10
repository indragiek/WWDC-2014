//
//  INDFlamingoViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDFlamingoViewController.h"

@implementation INDFlamingoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		[self reloadDataWithJSONFileName:@"flamingo"];
	}
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	UINavigationBar *navigationBar = self.navigationController.navigationBar;
	[UIView animateWithDuration:IND_TRANSITION_ANIMATION_DURATION animations:^{
		navigationBar.tintColor = IND_FLAMINGO_TINT_COLOR;
		navigationBar.barTintColor = IND_FLAMINGO_BAR_TINT_COLOR;
		navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : IND_FLAMINGO_TINT_COLOR};
	}];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.title = @"Flamingo";
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
