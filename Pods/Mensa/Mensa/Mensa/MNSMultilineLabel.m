//
//  MNSMultilineLabel.m
//  Mensa
//
//  Created by Jordan Kay on 12/9/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSMultilineLabel.h"

@implementation MNSMultilineLabel

#pragma mark - NSObject

- (void)awakeFromNib
{
    self.numberOfLines = 0;
}

#pragma mark - UIView

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    self.preferredMaxLayoutWidth = bounds.size.width;
}

@end
