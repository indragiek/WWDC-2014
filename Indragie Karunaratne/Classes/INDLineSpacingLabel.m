//
//  INDLineSpacingLabel.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDLineSpacingLabel.h"

@implementation INDLineSpacingLabel

- (void)setInd_lineSpacing:(CGFloat)ind_lineSpacing
{
	if (_ind_lineSpacing != ind_lineSpacing) {
		_ind_lineSpacing = ind_lineSpacing;
		if (self.attributedText.length == 0) return;
		
		[self ind_addLineSpacingAttribute];
	}
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
	[super setAttributedText:attributedText];
	[self ind_addLineSpacingAttribute];
}

- (void)ind_addLineSpacingAttribute
{
	NSMutableAttributedString *attrText = self.attributedText.mutableCopy;
	NSMutableParagraphStyle *style = [attrText attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:NULL];
	if (style == nil) {
		style = [[NSMutableParagraphStyle alloc] init];
	}
	style.lineSpacing = self.ind_lineSpacing;
	[attrText addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attrText.length)];
	[super setAttributedText:attrText];
}

@end
