//
//  INDHTMLToAttributedStringValueTransformer.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDHTMLToAttributedStringValueTransformer.h"

NSString * const INDHTMLToAttributedStringValueTransformerName = @"INDHTMLToAttributedStringValueTransformer";

@implementation INDHTMLToAttributedStringValueTransformer

+ (void)load
{
	[self setValueTransformer:[[self alloc] init] forName:INDHTMLToAttributedStringValueTransformerName];
}

+ (Class)transformedValueClass
{
	return NSAttributedString.class;
}

+ (BOOL)allowsReverseTransformation
{
	return NO;
}

- (id)transformedValue:(id)value
{
	NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	NSAttributedString *attributedText = [[NSAttributedString alloc] initWithData:data options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:&error];
	if (attributedText == nil) {
		NSLog(@"Error parsing HTML: %@", error);
	}
	return attributedText;
}

@end
