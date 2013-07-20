//
//  ExpandableCellViewController.m
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "AnimalsViewController.h"

@implementation AnimalsViewController

#define CELL_HEIGHT_EXPANDED 165
#define CELL_HEIGHT_COLLAPSED 40

#pragma mark - UIViewcontroller Methods -

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.animals = [AnimalStorage allAnimals];
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Animal *animal = [self.animals objectAtIndex:indexPath.row];
	
	AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimalCell"];
	[cell setAnimal:animal];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([indexPath isEqual:self.expandedIndexPath])
		return CELL_HEIGHT_EXPANDED;
	else
		return CELL_HEIGHT_COLLAPSED;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	self.expandedIndexPath = ([self.expandedIndexPath isEqual:indexPath]) ? nil : indexPath;
	
	[tableView beginUpdates];
	[tableView endUpdates];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
