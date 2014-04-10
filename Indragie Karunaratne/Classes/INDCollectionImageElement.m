//
//  INDCollectionImageElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionImageElement.h"
#import "INDImageNameToImageValueTransformer.h"

@implementation INDCollectionImageElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{@"image" : @"imageName"};
}

+ (NSValueTransformer *)imageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

@end
