//
//  INDCollectionTextElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTextElement.h"
#import "INDHTMLToAttributedStringValueTransformer.h"

@implementation INDCollectionTextElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{@"attributedText" : @"html"};
}

+ (NSValueTransformer *)attributedTextJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDHTMLToAttributedStringValueTransformerName];
}

@end
