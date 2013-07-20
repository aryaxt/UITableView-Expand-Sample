//
//  MoviesActionViewController.m
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "AnimalsActionViewController.h"

@implementation AnimalsActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.animals = [AnimalStorage allAnimals];
	[self.table setEditing:YES];
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Animal *movie = [self.animals objectAtIndex:indexPath.row];
	
	AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimalCell"];
	[cell setAnimal:movie];
	cell.delegate = self;
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 45;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if ([indexPath isEqual:self.indexPathOfEditingCell])
		return YES;
	
	return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleNone;
}

#pragma mark - AnimalCellDelegate Methods -

- (void)animalCellDidEnterEditMode:(AnimalCell *)cell {
	NSIndexPath *indexPath = [self.table indexPathForCell:cell];
	self.indexPathOfEditingCell = indexPath;
	
	[self.table beginUpdates];
	[self.table endUpdates];
}

- (void)animalCellDidEndEditMode:(AnimalCell *)cell {
	self.indexPathOfEditingCell = nil;
	
	[self.table beginUpdates];
	[self.table endUpdates];
}

@end
