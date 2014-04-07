//
//  INDJSONModelAdapter.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Adapter for converting arrays of model objects between JSON and object representations.
 */
@interface INDJSONModelAdapter : NSObject

/**
 *  Converts an array of model objects to an array of JSON dictionaries.
 *
 *  @param objects Array of `MTLModel` objects conforming to `MTLJSONSerializing`
 *
 *  @return An array of JSON dictionaries representing the model objects.
 */
+ (NSArray *)JSONArrayForModelObjects:(NSArray *)objects;

/**
 *  Converts an array of JSON dictionaries to an array of model objects.
 *
 *  @param JSONArray Array of JSON dictionaries previously created by using
 *  `+JSONArrayForModelObjects:`
 *
 *  @return An array of `MTLModel` objects conforming to `MTLJSONSerializing`.
 */
+ (NSArray *)modelObjectsFromJSONArray:(NSArray *)JSONArray;

@end
