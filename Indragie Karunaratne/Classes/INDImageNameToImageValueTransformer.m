//
//  INDImageNameToImageValueTransformer.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDImageNameToImageValueTransformer.h"
#import <objc/runtime.h>

NSString * const INDImageNameToImageValueTransformerName = @"INDImageNameToImageValueTransformer";
static void * INDImageNameKey = &INDImageNameKey;

@implementation INDImageNameToImageValueTransformer

+ (void)load
{
	[self setValueTransformer:[[self alloc] init] forName:INDImageNameToImageValueTransformerName];
}

+ (Class)transformedValueClass
{
	return UIImage.class;
}

+ (BOOL)allowsReverseTransformation
{
	return YES;
}

- (id)transformedValue:(id)value
{
	if (value == nil) {
		return nil;
	} else {
		UIImage *image = [UIImage imageNamed:value];
		objc_setAssociatedObject(image, INDImageNameKey, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
		return image;
	}
}

- (id)reverseTransformedValue:(id)value
{
	return (value == nil) ? nil : objc_getAssociatedObject(value, INDImageNameKey);
}

@end
