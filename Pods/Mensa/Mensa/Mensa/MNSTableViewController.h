//
//  MNSTableViewController.h
//  Mensa
//
//  Created by Jonathan Wight on 7/26/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSDataMediator.h"
#import "MNSSection.h"
#import "MNSHostedViewController.h"
#import "MNSHostingTableViewCell.h"
#import "MNSViewControllerRegistrar.h"

@interface MNSTableViewController : UITableViewController <MNSDataMediatorDelegate>

- (void)reloadDataAndUpdateTableView;

@end
