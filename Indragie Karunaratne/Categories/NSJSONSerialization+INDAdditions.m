//
//  NSJSONSerialization+INDAdditions.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "NSJSONSerialization+INDAdditions.h"

@implementation NSJSONSerialization (INDAdditions)

+ (id)ind_deserializeJSONObjectFromContentsOfFileName:(NSString *)name error:(NSError **)error
{
	NSString *path = [NSBundle.mainBundle pathForResource:name ofType:@"json"];
	if (path == nil) return nil;
	
	NSData *data = [NSData dataWithContentsOfFile:path];
	return [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
}

@end
