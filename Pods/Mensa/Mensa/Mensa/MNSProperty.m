//
//  MNSProperty.m
//  Mensa
//
//  Created by Jordan Kay on 12/15/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSProperty.h"

@implementation MNSProperty

- (instancetype)initWithName:(NSString *)name value:(id)value
{
    if (self = [super init]) {
        _name = [name copy];
        _value = value;
    }
    return self;
}

- (void)setValue:(id)value
{
    if (_value != value) {
        _value = value;
        if (self.valueChangedBlock) {
            self.valueChangedBlock(value);
        }
    }
}

@end
