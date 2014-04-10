//
//  INDCollectionButtonElement.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Mantle/Mantle.h>

/**
 *  Collection view element model representing a button that links to a URL.
 */
@interface INDCollectionButtonElement : MTLModel <MTLJSONSerializing>

/**
 *  Title text of the button.
 */
@property (nonatomic, copy, readonly) NSString *title;

/**
 *  URL that the button opens when tapped.
 */
@property (nonatomic, strong, readonly) NSURL *url;

@end
