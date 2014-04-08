//
//  INDLineSpacingLabel.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "MNSMultilineLabel.h"
/**
 *  UILabel subclass with adjustable line spacing.
 */
@interface INDLineSpacingLabel : MNSMultilineLabel

/**
 *  Line spacing. 
 *
 *  Naming this property `lineSpacing` breaks `UILabel`. Private property?
 */
@property (nonatomic, assign) CGFloat ind_lineSpacing;

@end
