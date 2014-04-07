//
//  MNSViewControllerRegistrar.h
//  Mensa
//
//  Created by Jordan Kay on 12/6/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNSViewControllerRegistrar : NSObject

+ (void)registerViewControllerClasses;
+ (void)registerViewControllerClass:(Class)viewControllerClass forModelClass:(Class)modelClass;
+ (Class)viewControllerClassForModelClass:(Class)modelClass;

@end
