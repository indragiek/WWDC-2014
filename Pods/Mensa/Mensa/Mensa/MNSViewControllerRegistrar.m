//
//  MNSViewControllerRegistrar.m
//  Mensa
//
//  Created by Jordan Kay on 12/6/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSViewControllerRegistrar.h"

static NSMutableDictionary *registeredViewControllerClasses;

@implementation MNSViewControllerRegistrar

+ (void)registerViewControllerClasses
{
    static BOOL didRegisterViewControllerClasses;
    if (!registeredViewControllerClasses) {
        registeredViewControllerClasses = [NSMutableDictionary dictionary];
    }
    if (!didRegisterViewControllerClasses) {


        didRegisterViewControllerClasses = YES;
    }
}

+ (void)registerViewControllerClass:(Class)viewControllerClass forModelClass:(Class)modelClass
{
    [self registerViewControllerClasses];
    registeredViewControllerClasses[(id<NSCopying>)modelClass] = viewControllerClass;
}

+ (Class)viewControllerClassForModelClass:(Class)modelClass
{
    return registeredViewControllerClasses[modelClass];
}

@end
