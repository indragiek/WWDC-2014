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
#import "INDSocialButton.h"
#import "AutoLayoutShorthand.h"

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
	
	UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 39.0)];
	INDSocialButton *twitter = [[INDSocialButton alloc] initWithFrame:CGRectZero];
	INDSocialButton *github = [[INDSocialButton alloc] initWithFrame:CGRectZero];
	[footerView addSubview:twitter];
	[footerView addSubview:github];
	
	[twitter als_addConstraints:@{
		@"left ==" : als_superview,
		@"bottom ==" : als_superview,
		@"top ==" : als_superview,
		@"width ==" : @{als_view : footerView.als_width, als_multiplier : @(0.5)}
	}];
	[github als_addConstraints:@{
		@"bottom ==" : als_superview,
		@"top ==" : als_superview,
		@"leading ==" : twitter.als_right,
		@"width ==" : twitter.als_width
	}];
	
	self.tableView.tableFooterView = footerView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
