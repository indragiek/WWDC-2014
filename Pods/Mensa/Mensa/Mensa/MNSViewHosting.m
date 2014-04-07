//
//  MNSViewHosting.m
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import "MNSViewHosting.h"
#import "MNSHostedViewController.h"

@implementation MNSViewHosting

+ (void)loadHostedViewForObject:(id)object inCell:(id <MNSHostingCell>)cell
{
    UIView *hostedView = [cell.hostedViewController viewForObject:object];
    NSParameterAssert(hostedView.superview == NULL);

    hostedView.frame = cell.hostingView.bounds;
    hostedView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [cell.hostingView addSubview:hostedView];
}

+ (void)setParentViewController:(UIViewController *)parentViewController forCell:(id<MNSHostingCell>)cell withObject:(id)object
{
    if (cell.parentViewController != parentViewController) {
        if (cell.parentViewController) {
            UIView *view = [cell.hostedViewController viewForObject:object];
            [cell.hostedViewController willMoveToParentViewController:nil];
            [view removeFromSuperview];
            [cell.hostedViewController removeFromParentViewController];
        }

        cell.parentViewController = parentViewController;

        if (cell.parentViewController) {
            [cell.parentViewController addChildViewController:cell.hostedViewController];
            [MNSViewHosting loadHostedViewForObject:object inCell:cell];
            [cell.hostedViewController didMoveToParentViewController:cell.parentViewController];
        }
    }
}

@end
