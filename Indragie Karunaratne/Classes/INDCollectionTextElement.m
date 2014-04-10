//
//  INDCollectionTextElement.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDCollectionTextElement.h"

@implementation INDCollectionTextElement

#pragma mark - MTLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{@"attributedText" : @"html"};
}

+ (NSValueTransformer *)attributedTextJSONTransformer
{
	return [MTLValueTransformer transformerWithBlock:^(NSString *html) {
		NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
		NSError *error = nil;
		NSAttributedString *attributedText = [[NSAttributedString alloc] initWithData:data options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:&error];
		if (attributedText == nil) {
			NSLog(@"Error parsing HTML: %@", error);
		}
		return attributedText;
	}];
}

@end
