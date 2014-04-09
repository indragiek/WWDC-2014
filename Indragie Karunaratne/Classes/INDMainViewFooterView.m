//
//  INDMainViewFooterView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDMainViewFooterView.h"
#import "INDSocialButton.h"
#import "AutoLayoutShorthand.h"

@interface INDMainViewFooterView ()
@property (nonatomic, strong, readwrite) UIButton *githubButton;
@property (nonatomic, strong, readwrite) UIButton *twitterButton;
@end

@implementation INDMainViewFooterView

#pragma mark - Initialization

static void CommonInit(INDMainViewFooterView *self)
{
	INDSocialButton *twitter = [INDSocialButton buttonWithType:UIButtonTypeCustom];
	twitter.backgroundColor = IND_MAIN_TWITTER_BG_COLOR;
	[twitter setImage:[UIImage imageNamed:@"twitter-icon"] forState:UIControlStateNormal];
	[twitter setTitle:@"Twitter" forState:UIControlStateNormal];
	[self addSubview:twitter];
	[twitter als_addConstraints:@{
		@"left ==" : als_superview,
		@"bottom ==" : als_superview,
		@"top ==" : als_superview,
		@"width ==" : @{als_view : self.als_width, als_multiplier : @(0.5)}
	}];
	
	INDSocialButton *github = [INDSocialButton buttonWithType:UIButtonTypeCustom];
	github.backgroundColor = IND_MAIN_GITHUB_BG_COLOR;
	[github setImage:[UIImage imageNamed:@"github-icon"] forState:UIControlStateNormal];
	[github setTitle:@"GitHub" forState:UIControlStateNormal];
	[self addSubview:github];
	[github als_addConstraints:@{
		@"bottom ==" : als_superview,
		@"top ==" : als_superview,
		@"leading ==" : twitter.als_right,
		@"width ==" : twitter.als_width
	}];
		
	self.twitterButton = twitter;
	self.githubButton = github;
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
