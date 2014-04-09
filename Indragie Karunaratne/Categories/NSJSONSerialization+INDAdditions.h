//
//  NSJSONSerialization+INDAdditions.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (INDAdditions)

/**
 *  Deserializes JSON from a .json resource file included in the app bundle.
 *
 *  @param name     The name of the JSON file in the main bundle, without file extension.
 *  @param options  Options for reading the JSON data and creating the Foundation objects.
 *  @param error    If an error occurs, upon return contains an NSError object that describes the problem.
 *
 *  @return A Foundation object from the JSON data in data, or nil if an error occurs.
 */
+ (id)ind_deserializeJSONObjectFromContentsOfFileName:(NSString *)name error:(NSError **)error;

@end
