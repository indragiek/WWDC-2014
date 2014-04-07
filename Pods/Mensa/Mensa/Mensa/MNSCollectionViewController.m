//
//  MNSCollectionViewController.m
//  Mensa
//
//  Created by Jordan Kay on 1/14/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import "MNSCollectionViewController.h"

#define INSET 10.0f

@interface MNSCollectionViewController ()

@property (nonatomic) MNSDataMediator *dataMediator;

@end

@implementation MNSCollectionViewController

@synthesize sections = _sections;

static NSString *cellIdentifier = @"MNSCollectionViewCell";

- (void)reloadDataAndUpdateCollectionView
{
    [self.dataMediator reloadDataWithUpdate:YES];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataMediator = [[MNSDataMediator alloc] initWithDelegate:self];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.dataMediator reloadDataWithUpdate:NO];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataMediator numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataMediator numberOfObjectsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MNSHostingCollectionViewCell *cell;
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    Class viewControllerClass = [MNSViewControllerRegistrar viewControllerClassForModelClass:[object class]];

    if (viewControllerClass) {
        NSString *reuseIdentifier = [viewControllerClass reuseIdentifierForObject:object];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        if ([self respondsToSelector:@selector(dataMediator:willLoadHostedViewForViewController:)]) {
            [self dataMediator:self.dataMediator willLoadHostedViewForViewController:cell.hostedViewController];
        }

        [MNSViewHosting setParentViewController:self forCell:cell withObject:object];
        cell.userInteractionEnabled = [cell.hostedViewController viewForObject:object].userInteractionEnabled;
        [self.dataMediator useViewController:cell.hostedViewController withObject:object];
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];;
    }

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    MNSHostingCollectionViewCell *cell = (MNSHostingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    return [self.dataMediator canSelectObject:object forViewController:cell.hostedViewController];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    MNSHostingCollectionViewCell *cell = (MNSHostingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self.dataMediator selectObject:object forViewController:cell.hostedViewController];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    MNSHostingCollectionViewCell *cell = (MNSHostingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.hostedViewController setViewHighlighted:YES forObject:object];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    MNSHostingCollectionViewCell *cell = (MNSHostingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.hostedViewController setViewHighlighted:NO forObject:object];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = layout.itemSize;
    id object = [self.dataMediator backingObjectForRowAtIndexPath:indexPath];
    MNSHostingCollectionViewCell *metricsCell = (MNSHostingCollectionViewCell *)[self.dataMediator metricsCellForClass:[object class]];

    if (metricsCell) {
        [self.dataMediator useViewController:metricsCell.hostedViewController withObject:object];
        [metricsCell layoutIfNeeded];

        size = [metricsCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    }
    
    return size;
}

#pragma mark - MNSDataMediatorDelegate

- (Class)cellClass:(MNSDataMediator *)dataMediator
{
    return [MNSHostingCollectionViewCell class];
}

- (void)dataMediator:(MNSDataMediator *)dataMediator didReloadDataWithUpdate:(BOOL)update
{
    if (update) {
        [self.collectionView reloadData];
    }
}

- (void)dataMediator:(MNSDataMediator *)dataMediator willUseCellClass:(Class)cellClass forReuseIdentifiers:(NSArray *)reuseIdentifiers
{
    for (NSString *reuseIdentifier in reuseIdentifiers) {
        [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:reuseIdentifier];
    }
}

- (void)dataMediator:(MNSDataMediator *)dataMediator willUseMetricsCell:(MNSHostingCollectionViewCell *)metricsCell
{
    [metricsCell useAsMetricsCellInCollectionView:self.collectionView];
}

@end
