//
//  MNSHostingCollectionViewCell.h
//  Mensa
//
//  Created by Jordan Kay on 1/13/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import "MNSViewHosting.h"
#import "MNSHostedViewController.h"

@interface MNSHostingCollectionViewCell : UICollectionViewCell <MNSHostingCell>

/**
 * Use this method to apply custom logic in a base MNSHostingCollectionViewCell subclass
 * when this cell is used as a metrics cell in a collection view. Useful for setting the cell’s
 * layoutInsets property based on the table view used.
 */
- (void)useAsMetricsCellInCollectionView:(UICollectionView *)collectionView;

@end
