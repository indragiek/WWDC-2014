//
//  MNSSection.m
//  Mensa
//
//  Created by Jordan Kay on 12/6/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSSection.h"

@interface MNSSection ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *objects;
@property (nonatomic, copy) NSString *summary;

@end

@implementation MNSSection

+ (instancetype)sectionWithObjects:(NSArray *)objects
{
    return [self sectionWithTitle:nil objects:objects];
}

+ (instancetype)sectionWithTitle:(NSString *)title objects:(NSArray *)objects
{
    return [self sectionWithTitle:title objects:objects summary:nil];
}

+ (instancetype)sectionWithTitle:(NSString *)title objects:(NSArray *)objects summary:(NSString *)summary
{
    MNSSection *section = [MNSSection new];
    section.title = title;
    section.objects = objects;
    section.summary = summary;
    return section;
}

- (NSUInteger)count
{
    return [self.objects count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.objects[idx];
}

#pragma mark - NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
    return [self.objects countByEnumeratingWithState:state objects:buffer count:len];
}

@end
