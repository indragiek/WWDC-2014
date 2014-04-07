//
//  MNSProperty.h
//  Mensa
//
//  Created by Jordan Kay on 12/15/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

typedef NS_OPTIONS(NSUInteger, MNSPropertyOptions) {
    MNSPropertyOptionHidesName               = 1 << 0,
    MNSPropertyOptionAllowsUserInput         = 1 << 1,
    MNSPropertyOptionTogglesBoolean          = 1 << 2,
    MNSPropertyOptionHidesDisclosureForValue = 1 << 3,
};

typedef void (^MNSPropertyValueChangedBlock)(id value);

@interface MNSProperty : NSObject

- (instancetype)initWithName:(NSString *)name value:(id)value;

@property (nonatomic) id value;
@property (nonatomic) MNSPropertyOptions options;
@property (nonatomic, copy) MNSPropertyValueChangedBlock valueChangedBlock;
@property (nonatomic, copy, readonly) NSString *name;

@end
