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
	return @{@"iconImage" : @"icon_name",
			 @"backgroundImage" : @"background_name",
			 @"projectDescription" : @"project_description"};
}

+ (NSValueTransformer *)iconImageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

+ (NSValueTransformer *)backgroundImageJSONTransformer
{
	return [NSValueTransformer valueTransformerForName:INDImageNameToImageValueTransformerName];
}

@end
