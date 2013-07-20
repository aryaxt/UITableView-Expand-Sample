//
//  MovieCategoriesViewController.m
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "AnimalsCategoriesViewController.h"

@implementation AnimalsCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.allowMultipleExpansion = YES;
	self.expandedSections = [NSMutableArray array];
	
	self.animalCategories = [AnimalStorage animalCategories];
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.animalCategories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	AnimalCategory *category = [self.animalCategories objectAtIndex:section];
	NSNumber *currentSection = [NSNumber numberWithInt:section];
	
	if ([self.expandedSections containsObject:currentSection])
		return category.breeds.count;
	else
		return 0;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	AnimalCategory *category = [self.animalCategories objectAtIndex:indexPath.section];
	Animal *animal = [category.breeds objectAtIndex:indexPath.row];
	
	AnimalCell *cell = (AnimalCell *)[aTableView dequeueReusableCellWithIdentifier:@"AnimalCell"];
	[cell setAnimal:animal];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 43;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	NSInteger headerHeight = [self tableView:self.tableView heightForHeaderInSection:section];
	AnimalCategory *category = [self.animalCategories objectAtIndex:section];
	
	UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, headerHeight)];
	header.text = [NSString stringWithFormat:@"  %@", category.name];
	header.backgroundColor = [UIColor grayColor];
	header.tag = section;
	header.userInteractionEnabled = YES;
	header.backgroundColor = [UIColor lightGrayColor];
	header.textColor = [UIColor blackColor];
	header.shadowColor = [UIColor whiteColor];
	header.shadowOffset = CGSizeMake(0, -1);
	header.font = [UIFont boldSystemFontOfSize:18];
	
	UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headerHeight-1, self.tableView.frame.size.width, 1)];
	[lineView setBackgroundColor:[UIColor darkGrayColor]];
	[header addSubview:lineView];
	
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animalCategoryHeaderDidDetectTap:)];
	[header addGestureRecognizer:tapRecognizer];
	
	return header;
}

#pragma mark - IBActions -

- (IBAction)switchDidChangeValue:(UISwitch *)sender
{
	self.allowMultipleExpansion = sender.isOn;
}

#pragma mark - Tap Detection - 

- (void)animalCategoryHeaderDidDetectTap:(UITapGestureRecognizer *)gestureRecognizer {
	NSInteger section = gestureRecognizer.view.tag;
	NSNumber *currentSection = [NSNumber numberWithInt:section];
	
	[self.tableView beginUpdates];
	
	if ([self.expandedSections containsObject:currentSection]) {
		[self.expandedSections removeObject:currentSection];
		[self deleteRowsInSection:currentSection.intValue];
	}
	else {
		if (!self.allowMultipleExpansion) {
			[self.expandedSections removeAllObjects];
			[self deleteAllRows];
		}
		
		[self.expandedSections addObject:currentSection];
		[self insertRowsInSection:currentSection.intValue];
	}
	
	[self.tableView endUpdates];
}

#pragma mark - Private Methods -

- (void)deleteAllRows {
	NSInteger sections = [self.tableView numberOfSections];
	
	for (int i=0 ; i<sections ; i++) {
		[self deleteRowsInSection:i];
	}
}

- (void)deleteRowsInSection:(NSInteger)section {
	NSInteger numberOfRowsInSection = [self.tableView numberOfRowsInSection:section];
	
	for (int i=0 ; i<numberOfRowsInSection ; i++) {
		NSIndexPath *insertingIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
		[self.tableView deleteRowsAtIndexPaths:@[insertingIndexPath] withRowAnimation:UITableViewRowAnimationTop];
	}
}

- (void)insertRowsInSection:(NSInteger)section {
	AnimalCategory *category = [self.animalCategories objectAtIndex:section];
	
	for (int i=0 ; i<category.breeds.count ; i++) {
		NSIndexPath *insertingIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
		[self.tableView insertRowsAtIndexPaths:@[insertingIndexPath] withRowAnimation:UITableViewRowAnimationTop];
	}
}

@end
