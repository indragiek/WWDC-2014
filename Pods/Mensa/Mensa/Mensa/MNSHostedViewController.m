//
//  MNSHostedViewController.m
//  Mensa
//
//  Created by Jordan Kay on 12/6/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSHostingTableViewCell.h"
#import "MNSHostedViewController.h"

@implementation MNSHostedViewController

- (void)updateView:(UIView *)view withObject:(id)object
{
    // Subclasses implement
}

- (void)selectObject:(id)object
{
    // Subclasses implement
}

- (BOOL)canSelectObject:(id)object
{
    return YES;
}

- (void)setViewHighlighted:(BOOL)highlighted forObject:(id)object
{
    // Subclasses implement
}

- (UIView *)viewForObject:(id)object
{
    return self.view;
}

+ (NSArray *)reuseIdentifiers
{
    return @[NSStringFromClass(self)];
}

+ (NSString *)reuseIdentifierForObject:(id)object
{
    return NSStringFromClass(self);
}

@end
