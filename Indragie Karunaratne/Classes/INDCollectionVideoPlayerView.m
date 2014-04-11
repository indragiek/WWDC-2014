//
//  INDCollectionVideoPlayerView.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionVideoPlayerView.h"

@interface INDCollectionVideoPlayerView ()
@property (nonatomic, strong, readonly) AVPlayerLayer *playerLayer;
@end

@implementation INDCollectionVideoPlayerView

#pragma mark - Accessors

+ (Class)layerClass
{
	return AVPlayerLayer.class;
}

- (AVPlayerLayer *)playerLayer
{
	return (AVPlayerLayer *)self.layer;
}

- (void)setPlayer:(AVPlayer *)player
{
	if (_player != player) {
		NSNotificationCenter *nc = NSNotificationCenter.defaultCenter;
		if (_player) {
			[nc removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
		}
		_player = player;
		_player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
		[nc addObserver:self selector:@selector(playbackDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:player.currentItem];
		self.playerLayer.player = player;
	}
}

- (void)playbackDidEnd:(NSNotification *)notification
{
	AVPlayerItem *item = notification.object;
	[item seekToTime:kCMTimeZero];
}

#pragma mark - Cleanup

- (void)dealloc
{
	[NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
