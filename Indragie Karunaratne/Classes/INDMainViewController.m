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
#import "INDMainViewFooterView.h"

static NSString * const INDMainViewGithubURL = @"https://github.com/indragiek";
static NSString * const INDMainViewTwitterURL = @"https://twitter.com/indragie";

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
	
	INDMainViewFooterView *footerView = [[INDMainViewFooterView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 39.0)];
	[footerView.twitterButton addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
	[footerView.githubButton addTarget:self action:@selector(github:) forControlEvents:UIControlEventTouchUpInside];
	
	self.tableView.tableFooterView = footerView;
}

#pragma mark - Button Actions

- (void)github:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:INDMainViewGithubURL]];
}

- (void)twitter:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:INDMainViewTwitterURL]];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
	
	INDMainViewItem *item = self.objects[indexPath.row];
	Class vcClass = item.viewControllerClass;
	if (vcClass != Nil) {
		UIViewController *viewController = [[vcClass alloc] initWithNibName:NSStringFromClass(vcClass) bundle:nil];
		[self.navigationController pushViewController:viewController animated:YES];
	}
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Accessors

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
