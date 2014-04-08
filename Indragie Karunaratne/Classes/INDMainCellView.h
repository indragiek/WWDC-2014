//
//  INDMainCellView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDLineSpacingLabel.h"

/**
 *  Content view for table view cells in the main view.
 */
@interface INDMainCellView : UIView

/**
 *  Image view that shows the background image.
 */
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

/**
 *  Image view that shows the icon for the project.
 */
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

/**
 *  Label to show the title of the project.
 */
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

/**
 *  Label to show a description for the project.
 */
@property (nonatomic, weak) IBOutlet INDLineSpacingLabel *descriptionLabel;

@end
