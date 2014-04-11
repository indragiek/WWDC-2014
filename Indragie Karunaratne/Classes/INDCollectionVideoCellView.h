//
//  INDCollectionVideoCellView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionVideoPlayerView.h"

/**
 *  Content view for a collection view cell that displays a video.
 */
@interface INDCollectionVideoCellView : UIView

/**
 *  Inline video player view.
 */
@property (nonatomic, weak) IBOutlet INDCollectionVideoPlayerView *playerView;

@end
