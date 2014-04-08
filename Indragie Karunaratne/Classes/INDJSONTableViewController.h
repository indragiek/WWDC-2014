//
//  INDJSONTableViewController.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "MNSTableViewController.h"
#import "MNSViewControllerRegistrar.h"

/**
 *  Table view controller driven by JSON files as the data source.
 */
@interface INDJSONTableViewController : MNSTableViewController

/**
 *  Loads table view data from JSON loaded from a file.
 *
 *  This method searches for JSON files in the main bundle.
 *
 *  @param fileName The name of the JSON file to load data from. The file should
 *  contain a JSON array of model objects constructed using `INDJSONModelAdapter`.
 *
 */
- (void)reloadDataWithJSONFileName:(NSString *)fileName;

@end
