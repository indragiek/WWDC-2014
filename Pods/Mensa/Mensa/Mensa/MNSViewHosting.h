//
//  MNSViewHosting.h
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

@class MNSHostedViewController;

@protocol MNSHostingCell;

@interface MNSViewHosting : NSObject

/**
 * Adds the hosted view controller’s view for the given object to a cell’s content view.
 */
+ (void)loadHostedViewForObject:(id)object inCell:(id <MNSHostingCell>)cell;
+ (void)setParentViewController:(UIViewController *)parentViewController forCell:(id<MNSHostingCell>)cell withObject:(id)object;

@end

@protocol MNSHostingCell <NSObject>

/**
 * Return a subclass of this class to instantiate cells hosting view controllers of
 * a specific class.
 */
+ (Class)subclassWithViewControllerClass:(Class)viewControllerClass;

@property (nonatomic) UIEdgeInsets layoutInsets;
@property (nonatomic, readonly) UIView *hostingView;
@property (nonatomic, readonly) Class hostedViewControllerClass;
@property (nonatomic, readonly) MNSHostedViewController *hostedViewController;
@property (nonatomic, weak) UIViewController *parentViewController;

@end
