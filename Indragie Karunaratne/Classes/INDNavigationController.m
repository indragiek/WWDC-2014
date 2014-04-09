//
//  INDNavigationController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDNavigationController.h"

@interface INDNavigationController () <UINavigationControllerDelegate>
@end

@implementation INDNavigationController

#pragma mark - Initialization

static void CommonInit(INDNavigationController *self)
{
	self.delegate = self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		CommonInit(self);
	}
	return self;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	[self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return self.topViewController.preferredStatusBarStyle;
}

@end
