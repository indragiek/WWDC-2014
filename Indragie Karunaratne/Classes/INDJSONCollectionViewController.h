//
//  INDJSONCollectionViewController.h
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-09.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "MNSCollectionViewController.h"

/**
 *  Collection view controller driven by JSON files as the data source.
 */
@interface INDJSONCollectionViewController : MNSCollectionViewController

/**
 *  Loads collection view data from JSON loaded from a file.
 *
 *  This method searches for JSON files in the main bundle.
 *
 *  @param fileName The name of the JSON file to load data from. The file should
 *  contain a JSON array of model objects constructed using `INDJSONModelAdapter`.
 *
 */
- (void)reloadDataWithJSONFileName:(NSString *)fileName;

/**
 *  Model objects displayed in the collection view.
 */
@property (nonatomic, strong, readonly) NSArray *objects;

@end
