//
//  INDCollectionVideoPlayerView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

/**
 *  A view that plays a video using `AVPlayerLayer` and repeats it when playback
 *  has ended.
 */
@interface INDCollectionVideoPlayerView : UIView

/**
 *  Player used for video playback.
 */
@property (nonatomic, strong) AVPlayer *player;

@end
