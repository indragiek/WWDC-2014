//
//  MNSSection.h
//  Mensa
//
//  Created by Jordan Kay on 12/6/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

@interface MNSSection : NSObject

+ (instancetype)sectionWithObjects:(NSArray *)objects;
+ (instancetype)sectionWithTitle:(NSString *)title objects:(NSArray *)objects;
+ (instancetype)sectionWithTitle:(NSString *)title objects:(NSArray *)objects summary:(NSString *)summary;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *summary;

@end

@interface MNSSection (Subscripting)

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

@end
