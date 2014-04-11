//
//  INDCollectionVideoCellViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionVideoCellViewController.h"
#import "INDCollectionVideoElement.h"
#import "INDCollectionVideoCellView.h"

@implementation INDCollectionVideoCellViewController

- (void)updateView:(INDCollectionVideoCellView *)view withObject:(INDCollectionVideoElement *)element
{
	AVPlayer *player = [AVPlayer playerWithURL:element.url];
	player.muted = YES;
	view.playerView.player = player;
	[player play];
}

@end
