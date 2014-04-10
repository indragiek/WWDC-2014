//
//  INDCollectionButtonCellView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionButtonCellView.h"

@implementation INDCollectionButtonCellView

- (void)awakeFromNib
{
	[super awakeFromNib];
	[self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressed:(id)sender
{
	if (self.url == nil) return;
	[UIApplication.sharedApplication openURL:self.url];
}

@end
