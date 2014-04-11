//
//  INDCollectionVideoElement.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Mantle/Mantle.h>

/**
 *  Collection view element model representing a video.
 */
@interface INDCollectionVideoElement : MTLModel <MTLJSONSerializing>

/**
 *  Video URL.
 */
@property (nonatomic, strong, readonly) NSURL *url;

@end
