//
//  INDCollectionImageCellView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionImageCellView.h"
#import "JTSImageViewController.h"

@implementation INDCollectionImageCellView

- (void)awakeFromNib
{
	[super awakeFromNib];
	self.imageView.userInteractionEnabled = YES;
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
	[recognizer addTarget:self action:@selector(handleImageTap:)];
	[self.imageView addGestureRecognizer:recognizer];
}

- (void)handleImageTap:(UIGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateEnded && self.bigImageName) {
		JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
		imageInfo.image = [UIImage imageNamed:self.bigImageName];
		imageInfo.referenceRect = self.imageView.frame;
		imageInfo.referenceView = self.imageView.superview;
		
		JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
											   initWithImageInfo:imageInfo
											   mode:JTSImageViewControllerMode_Image
											   backgroundStyle:JTSImageViewControllerBackgroundStyle_ScaledDimmedBlurred];
		UIResponder *responder = self;
		while (![responder isKindOfClass:UIViewController.class]) {
			responder = responder.nextResponder;
		}
		[imageViewer showFromViewController:(UIViewController *)responder transition:JTSImageViewControllerTransition_FromOriginalPosition];
    }
}

@end
