//
//  MNSDataMediator.h
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import "MNSDataMediator.h"
#import "MNSHostedViewController.h"
#import "MNSViewHosting.h"
#import "MNSViewControllerRegistrar.h"
#import "MNSSection.h"

@interface MNSDataMediator ()

@property (nonatomic) NSMutableDictionary *metricsCells;
@property (nonatomic, copy) NSArray *backingSections;

@end

@implementation MNSDataMediator

- (instancetype)initWithDelegate:(id<MNSDataMediatorDelegate>)delegate
{
    if (self = [super init]) {
        _delegate = delegate;
        _metricsCells = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)reloadDataWithUpdate:(BOOL)update
{
    self.backingSections = self.delegate.sections;
    [self.delegate dataMediator:self didReloadDataWithUpdate:update];
}

- (void)useViewController:(MNSHostedViewController *)viewController withObject:(id)object
{
    UIView *view = [viewController viewForObject:object];
    [viewController updateView:view withObject:object];
    if ([self.delegate respondsToSelector:@selector(dataMediator:didUseViewController:withObject:)]) {
        [self.delegate dataMediator:self didUseViewController:viewController withObject:object];
    }
}

- (BOOL)canSelectObject:(id)object forViewController:(MNSHostedViewController *)viewController
{
    return [viewController canSelectObject:object];
}

- (void)selectObject:(id)object forViewController:(MNSHostedViewController *)viewController
{
    if ([self canSelectObject:object forViewController:viewController]) {
        [viewController selectObject:object];
    }
}

- (void)setBackingSections:(NSArray *)backingSections
{
    if (self.metricsCells && _backingSections != backingSections) {
        NSMutableArray *sections = [NSMutableArray arrayWithCapacity:[backingSections count]];
        for (id section in backingSections) {
            if ([section isKindOfClass:[NSArray class]]) {
                [sections addObject:[MNSSection sectionWithObjects:section]];
            } else {
                [sections addObject:section];
            }
            for (id object in section) {
                Class modelClass = [object class];
                if (!self.metricsCells[modelClass]) {
                    id<MNSHostingCell> metricsCell = [self _metricsCellForObject:object];
                    if (metricsCell) {
                        self.metricsCells[(id<NSCopying>)modelClass] = metricsCell;
                    }
                }
            }
        }
        _backingSections = [sections copy];
    }
}

- (id<MNSHostingCell>)metricsCellForClass:(Class)class
{
    return self.metricsCells[class];
}

- (id)backingObjectForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.backingSections[indexPath.section][indexPath.row];
}

- (NSInteger)numberOfSections
{
    return [self.backingSections count];
}
- (NSInteger)numberOfObjectsInSection:(NSInteger)section
{
    return [self.backingSections[section] count];
}

- (NSString *)titleForSection:(NSInteger)section
{
    return [self.backingSections[section] title];
}

- (NSString *)summaryForSection:(NSInteger)section
{
    return [self.backingSections[section] summary];
}

- (id <MNSHostingCell>)_metricsCellForObject:(id)object
{
    id<MNSHostingCell> metricsCell;
    Class modelClass = [object class];

    // MNSHostingTableViewCell dynamically generates a subclass of itself that automatically hosts a view controller of a specific class.
    Class viewControllerClass = [MNSViewControllerRegistrar viewControllerClassForModelClass:modelClass];
    if (viewControllerClass) {
        Class cellClass = [[self.delegate cellClass:self] subclassWithViewControllerClass:viewControllerClass];
        NSArray *reuseIdentifiers = [viewControllerClass reuseIdentifiers];
        [self.delegate dataMediator:self willUseCellClass:cellClass forReuseIdentifiers:reuseIdentifiers];
        
        // Instead of storing a metrics cell we could just dequeue them as needed off of the table view. But due to the way our hosted cells work we can’t do that here
        if ([metricsCell isKindOfClass:[UITableViewCell class]]) {
            metricsCell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        } else {
            metricsCell = [[cellClass alloc] init];
        }
        if ([self.delegate respondsToSelector:@selector(dataMediator:willLoadHostedViewForViewController:)]) {
            [self.delegate dataMediator:self willLoadHostedViewForViewController:metricsCell.hostedViewController];
        }
        [MNSViewHosting loadHostedViewForObject:object inCell:metricsCell];
        [self.delegate dataMediator:self willUseMetricsCell:metricsCell];
    }

    return metricsCell;
}


@end
