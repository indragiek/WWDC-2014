//
//  MNSHostingCollectionViewCell.m
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import <objc/runtime.h>
#import "MNSHostedViewController.h"
#import "MNSHostingCollectionViewCell.h"

@implementation MNSHostingCollectionViewCell

@synthesize layoutInsets = _layoutInsets;
@synthesize hostedViewController = _hostedViewController;
@synthesize hostedViewControllerClass = _hostedViewControllerClass;
@synthesize parentViewController = _parentViewController;

- (void)useAsMetricsCellInCollectionView:(UICollectionView *)tableView
{
    // Subclasses implement
}

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		Class class = self.hostedViewControllerClass;
		_hostedViewController = [[class alloc] initWithNibName:NSStringFromClass(class) bundle:nil];

        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

#pragma mark - MNSHostingCell

+ (Class)subclassWithViewControllerClass:(Class)viewControllerClass
{
	NSString *className = [NSString stringWithFormat:@"%@_%@", NSStringFromClass(self), NSStringFromClass(viewControllerClass)];
    Class class = NSClassFromString(className);
    if (!class) {
        class = objc_allocateClassPair(self, [className UTF8String], 0);
        id (^block)(id) = ^(id self) {
            return viewControllerClass;
        };
        IMP implementation = imp_implementationWithBlock([block copy]);
        class_addMethod(class, NSSelectorFromString(@"hostedViewControllerClass"), implementation, "#@:");
        objc_registerClassPair(class);
    }
	return class;
}

- (UIView *)hostingView
{
    return self.contentView;
}

@end
