//
//  INDCollectionImageElement.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Mantle/Mantle.h>

/**
 *  Collection view element model representing image content.
 */
@interface INDCollectionImageElement : MTLModel <MTLJSONSerializing>

/**
 *  Image name of the standard (small) image.
 */
@property (nonatomic, copy, readonly) NSString *imageName;

/**
 *  Image name of the full image.
 */
@property (nonatomic, copy, readonly) NSString *bigImageName;

@end
