//
//  INDCollectionVideoElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionVideoElement.h"

@implementation INDCollectionVideoElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{@"url" : @"videoFilename"};
}

+ (NSValueTransformer *)urlJSONTransformer
{
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *name) {
		return [NSBundle.mainBundle URLForResource:[name stringByDeletingPathExtension] withExtension:name.pathExtension];
	} reverseBlock:^id(NSURL *url) {
		return url.path.lastPathComponent;
	}];
}

@end
