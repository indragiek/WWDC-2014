//
//  INDCollectionButtonElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionButtonElement.h"

@implementation INDCollectionButtonElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{};
}

+ (NSValueTransformer *)urlJSONTransformer
{
	return [MTLValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
