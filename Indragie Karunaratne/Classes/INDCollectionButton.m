//
//  INDCollectionButton.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionButton.h"

static CGFloat const INDCollectionButtonXInset = 20.0;

@implementation INDCollectionButton

static void CommonInit(INDCollectionButton *self)
{
	self.layer.borderColor = IND_COLLECTION_BUTTON_BORDER_COLOR.CGColor;
	self.layer.borderWidth = IND_COLLECTION_BUTTON_BORDER_WIDTH;
	self.layer.cornerRadius = IND_COLLECTION_BUTTON_BORDER_RADIUS;
	[self setTitleColor:IND_COLLECTION_BUTTON_TEXT_COLOR forState:UIControlStateNormal];
	[self setTitleColor:IND_COLLECTION_BUTTON_H_TEXT_COLOR forState:UIControlStateHighlighted];
	self.backgroundColor = IND_COLLECTION_BUTTON_BG_COLOR;
	self.titleEdgeInsets = UIEdgeInsetsMake(0.0, INDCollectionButtonXInset, 0, INDCollectionButtonXInset);
	self.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self addTarget:self action:@selector(touchDownEvent:) forControlEvents:UIControlEventTouchDown];
	[self addTarget:self action:@selector(touchUpEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
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

#pragma mark - Layout

- (CGSize)intrinsicContentSize
{
	CGSize size = [super intrinsicContentSize];
	size.width += INDCollectionButtonXInset * 2.0;
	return size;
}

#pragma mark - Touch Events

- (void)touchDownEvent:(id)sender
{
	self.backgroundColor = IND_COLLECTION_BUTTON_H_BG_COLOR;
}

- (void)touchUpEvent:(id)sender
{
	self.backgroundColor = IND_COLLECTION_BUTTON_BG_COLOR;
}

@end
