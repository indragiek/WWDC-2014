//
//  MNSCollectionViewController.h
//  Mensa
//
//  Created by Jordan Kay on 1/14/14.
//  Copyright (c) 2014 Jordan Kay. All rights reserved.
//

#import "MNSDataMediator.h"
#import "MNSHostedViewController.h"
#import "MNSHostingCollectionViewCell.h"
#import "MNSSection.h"
#import "MNSViewControllerRegistrar.h"

@interface MNSCollectionViewController : UICollectionViewController <MNSDataMediatorDelegate>

- (void)reloadDataAndUpdateCollectionView;

@end
