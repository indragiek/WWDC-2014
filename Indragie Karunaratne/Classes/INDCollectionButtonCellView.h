//
//  INDCollectionButtonCellView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-10.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

/**
 *  Content view for a collection view cell that displays a button.
 */
@interface INDCollectionButtonCellView : UIView

@property (nonatomic, weak) IBOutlet UIButton *button;

/**
 *  URL to open when the button is tapped.
 */
@property (nonatomic, strong) NSURL *url;

@end
