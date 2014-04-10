//
//  INDSocialButton.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDSocialButton.h"
#import "AutoLayoutShorthand.h"

@interface INDSocialButton ()
@property (nonatomic, strong) UIImageView *caretView;
@property (nonatomic, strong) UIView *overlayView;
@end

@implementation INDSocialButton

#pragma mark - Initialization

static void CommonInit(INDSocialButton *self)
{
	self.translatesAutoresizingMaskIntoConstraints = NO;
	self.imageEdgeInsets = UIEdgeInsetsMake(1.0, 0.0, 0.0, 49.0);
	self.titleEdgeInsets = UIEdgeInsetsMake(1.0, 0.0, 0.0, 8.0);
	self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
	
	self.caretView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"caret-sm"]];
	self.caretView.translatesAutoresizingMaskIntoConstraints = NO;
	[self addSubview:self.caretView];
	[self.caretView als_addConstraints:@{
		@"centerY ==" : als_superview,
		@"right ==" : @{als_view : self.als_right, als_constant : @(-18.0)}
	}];

	self.overlayView = [[UIView alloc] initWithFrame:self.bounds];
	self.overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.overlayView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
	self.overlayView.hidden = YES;
	[self addSubview:self.overlayView];
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

#pragma mark - Touch Events

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	self.overlayView.hidden = !highlighted;
}

@end
