//
//  INDSocialButton.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDSocialButton.h"

@implementation INDSocialButton

#pragma mark - Initialization

static void CommonInit(INDSocialButton *self)
{
	self.translatesAutoresizingMaskIntoConstraints = NO;
	self.imageView.image = [UIImage imageNamed:@"github-icon"];
	self.backgroundColor = [UIColor blueColor];
}

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame])) {
		CommonInit(self);
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		CommonInit(self);
	}
	return self;
}

@end
