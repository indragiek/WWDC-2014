//
//  INDJSONModelAdapter.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDJSONModelAdapter.h"
#import <Mantle/Mantle.h>

static NSString * const INDJSONClassNameJSONKey = @"class_name";

@implementation INDJSONModelAdapter

+ (NSArray *)JSONArrayForModelObjects:(NSArray *)objects
{
	NSMutableArray *JSONArray = [NSMutableArray arrayWithCapacity:objects.count];
	for (MTLModel<MTLJSONSerializing> *model in objects) {
		NSAssert([model conformsToProtocol:@protocol(MTLJSONSerializing)], @"Model object %@ does not conform to MTLJSONSerializing", model);
		NSMutableDictionary *dictionary = [[MTLJSONAdapter JSONDictionaryFromModel:model] mutableCopy];
		dictionary[INDJSONClassNameJSONKey] = NSStringFromClass(model.class);
		[JSONArray addObject:dictionary];
	}
	return JSONArray;
}

+ (NSArray *)modelObjectsFromJSONArray:(NSArray *)JSONArray
{
	NSMutableArray *modelObjects = [NSMutableArray arrayWithCapacity:JSONArray.count];
	for (NSDictionary *dictionary in JSONArray) {
		NSString *className = dictionary[INDJSONClassNameJSONKey];
		NSAssert(className.length != 0, @"JSON dictionary %@ does not have %@ key", INDJSONClassNameJSONKey, dictionary);
		
		NSMutableDictionary *mtlDictionary = [dictionary mutableCopy];
		[mtlDictionary removeObjectForKey:INDJSONClassNameJSONKey];
		Class modelClass = NSClassFromString(className);
		NSError *error = nil;
		id modelObject = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:mtlDictionary error:&error];
		if (modelObject != nil) {
			[modelObjects addObject:modelObject];
		} else {
			NSLog(@"Error instantiating model object from JSON dictionary %@: %@", dictionary, error);
		}
	}
	return modelObjects;
}

@end
