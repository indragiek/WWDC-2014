//
//  INDSonoraViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-11.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDSonoraViewController.h"

@implementation INDSonoraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		[self reloadDataWithJSONFileName:@"sonora"];
	}
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	UINavigationBar *navigationBar = self.navigationController.navigationBar;
	[UIView animateWithDuration:IND_TRANSITION_ANIMATION_DURATION animations:^{
		navigationBar.tintColor = IND_SONORA_TINT_COLOR;
		navigationBar.barTintColor = IND_SONORA_BAR_TINT_COLOR;
		navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : IND_SONORA_TINT_COLOR};
	}];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.title = @"Sonora";
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
