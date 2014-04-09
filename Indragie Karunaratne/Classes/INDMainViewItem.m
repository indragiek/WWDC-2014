//
//  INDMainViewItem.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDMainViewItem.h"
#import "INDImageNameToImageValueTransformer.h"

@implementation INDMainViewItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{@"iconImage" : @"iconName",
			 @"backgroundImage" : @"backgroundName",
			 @"viewControllerClass" : @"vcClassName"};
}

+ (NSValueTransformer *)iconImageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

+ (NSValueTransformer *)backgroundImageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

+ (NSValueTransformer *)viewControllerClassJSONTransformer
{
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *name) {
		return NSClassFromString(name);
	} reverseBlock:^id(Class aClass) {
		return NSStringFromClass(aClass);
	}];
}

@end
