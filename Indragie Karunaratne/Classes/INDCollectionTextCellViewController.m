//
//  INDCollectionTextCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTextCellViewController.h"
#import "INDCollectionTextCellView.h"
#import "INDCollectionTextElement.h"

@implementation INDCollectionTextCellViewController

- (void)updateView:(INDCollectionTextCellView *)view withObject:(INDCollectionTextElement *)element
{
	view.label.attributedText = element.attributedText;
	view.label.ind_lineSpacing = element.lineSpacing;
}

@end
