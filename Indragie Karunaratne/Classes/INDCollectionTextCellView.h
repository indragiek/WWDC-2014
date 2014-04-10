//
//  INDCollectionTextCellView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDLineSpacingLabel.h"

/**
 *  Content view for a collection view cell that displays attributed text.
 */
@interface INDCollectionTextCellView : UIView
@property (nonatomic, weak) IBOutlet INDLineSpacingLabel *label;
@end
