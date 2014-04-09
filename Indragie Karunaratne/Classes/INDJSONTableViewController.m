//
//  INDJSONTableViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDJSONTableViewController.h"
#import "INDJSONModelAdapter.h"

@interface INDJSONTableViewController ()
@property (nonatomic, strong, readwrite) NSArray *objects;
@end

@implementation INDJSONTableViewController

#pragma mark - Initialization

- (void)reloadDataWithJSONFileName:(NSString *)fileName
{
	NSString *path = [NSBundle.mainBundle pathForResource:fileName ofType:@"json"];
	if (path == nil) return;
	
	NSData *data = [NSData dataWithContentsOfFile:path];
	NSError *error = nil;
	NSArray *JSONArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	if (JSONArray == nil) {
		NSLog(@"Error deserializing JSON: %@", error);
		return;
	}
	
	self.objects = [INDJSONModelAdapter modelObjectsFromJSONArray:JSONArray];
}

#pragma mark - MNSDataMediatorDelegate

- (NSArray *)sections
{
	return @[[MNSSection sectionWithObjects:self.objects]];
}

@end
