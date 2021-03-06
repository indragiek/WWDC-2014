//
//  INDCollectionImageCellView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Content view for a collection view cell that displays an image.
 */
@interface INDCollectionImageCellView : UIView

/**
 *  Image view used to display the image inline.
 */
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

/**
 *  Name of a big image to open on tap.
 */
@property (nonatomic, copy) NSString *bigImageName;

@end
