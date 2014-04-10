//
//  INDCollectionButtonCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionButtonCellViewController.h"
#import "INDCollectionButtonElement.h"
#import "INDCollectionButtonCellView.h"

@implementation INDCollectionButtonCellViewController

- (void)updateView:(INDCollectionButtonCellView *)view withObject:(INDCollectionButtonElement *)element
{
	[view.button setTitle:element.title forState:UIControlStateNormal];
	view.url = element.url;
}


@end
