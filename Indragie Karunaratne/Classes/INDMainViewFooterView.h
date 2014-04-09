//
//  INDMainViewFooterView.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol INDMainViewFooterViewDelegate;

/**
 *  Footer for the table view containing social buttons.
 */
@interface INDMainViewFooterView : UIView
@property (nonatomic, strong, readonly) UIButton *githubButton;
@property (nonatomic, strong, readonly) UIButton *twitterButton;
@end
