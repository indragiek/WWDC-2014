//
//  INDMainViewItem.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import <Mantle/Mantle.h>

/**
 *  Model object class for the table view items on the main view.
 */
@interface INDMainViewItem : MTLModel <MTLJSONSerializing>

/**
 *  Title of the project.
 */
@property (nonatomic, copy, readonly) NSString *title;

/**
 *  Short description of the project.
 */
@property (nonatomic, copy, readonly) NSString *projectDescription;

/**
 *  Project icon.
 */
@property (nonatomic, strong, readonly) UIImage *iconImage;

/**
 *  Background image for the project.
 */
@property (nonatomic, strong, readonly) UIImage *backgroundImage;

@end
