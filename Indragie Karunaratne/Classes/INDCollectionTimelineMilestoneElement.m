//
//  INDCollectionTimelineMilestoneElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTimelineMilestoneElement.h"
#import "INDImageNameToImageValueTransformer.h"
#import "INDHTMLToAttributedStringValueTransformer.h"

@implementation INDCollectionTimelineMilestoneElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:@{@"image" : @"imageName"}];
}

+ (NSValueTransformer *)imageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

@end
