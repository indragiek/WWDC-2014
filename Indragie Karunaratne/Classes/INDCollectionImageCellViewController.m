//
//  INDCollectionImageCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionImageCellViewController.h"
#import "INDCollectionImageCellView.h"
#import "INDCollectionImageElement.h"

@implementation INDCollectionImageCellViewController

- (void)updateView:(INDCollectionImageCellView *)view withObject:(INDCollectionImageElement *)element
{
	view.imageView.image = [UIImage imageNamed:element.imageName];
	view.bigImageName = element.bigImageName;
}

@end
