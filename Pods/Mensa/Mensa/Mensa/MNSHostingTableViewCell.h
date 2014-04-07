//
//  MNSHostingTableViewCell.h
//  Mensa
//
//  Created by Jonathan Wight on 7/18/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSViewHosting.h"
#import "MNSHostedViewController.h"

@interface MNSHostingTableViewCell : UITableViewCell <MNSHostingCell>

/**
 * Use this method to apply custom logic in a base MNSHostingTableViewCell subclass
 * when this cell is used as a metrics cell in a table view. Useful for setting the cell’s
 * layoutInsets property based on the table view used.
 */
- (void)useAsMetricsCellInTableView:(UITableView *)tableView;

@end
