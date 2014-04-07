//
//  MNSDataMediator.h
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

@class MNSHostedViewController;

@protocol MNSHostingCell;
@protocol MNSDataMediatorDelegate;

@interface MNSDataMediator : NSObject

- (instancetype)initWithDelegate:(id<MNSDataMediatorDelegate>)delegate;

- (void)reloadDataWithUpdate:(BOOL)update;
- (void)useViewController:(MNSHostedViewController *)viewController withObject:(id)object;
- (BOOL)canSelectObject:(id)object forViewController:(MNSHostedViewController *)viewController;
- (void)selectObject:(id)object forViewController:(MNSHostedViewController *)viewController;

- (id<MNSHostingCell>)metricsCellForClass:(Class)class;
- (id)backingObjectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfObjectsInSection:(NSInteger)section;
- (NSString *)titleForSection:(NSInteger)section;
- (NSString *)summaryForSection:(NSInteger)section;

@property (nonatomic, weak) id<MNSDataMediatorDelegate> delegate;

@end

@protocol MNSDataMediatorDelegate <NSObject>

- (Class)cellClass:(MNSDataMediator *)dataMediator;
- (void)dataMediator:(MNSDataMediator *)dataMediator willUseCellClass:(Class)cellClass forReuseIdentifiers:(NSArray *)reuseIdentifiers;
- (void)dataMediator:(MNSDataMediator *)dataMediator willUseMetricsCell:(id<MNSHostingCell>)metricsCell;
- (void)dataMediator:(MNSDataMediator *)dataMediator didReloadDataWithUpdate:(BOOL)update;

@property (nonatomic) NSArray *sections;

@optional

- (void)dataMediator:(MNSDataMediator *)dataMediator willLoadHostedViewForViewController:(MNSHostedViewController *)viewController;
- (void)dataMediator:(MNSDataMediator *)dataMediator didUseViewController:(MNSHostedViewController *)viewController withObject:(id)object;

@end
