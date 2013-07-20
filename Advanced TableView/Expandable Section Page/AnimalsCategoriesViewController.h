//
//  MovieCategoriesViewController.h
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalCategory.h"
#import "Animal.h"
#import "AnimalCell.h"
#import "AnimalStorage.h"

@interface AnimalsCategoriesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *animalCategories;
@property (nonatomic, strong) NSMutableArray *expandedSections;
@property (nonatomic, assign) BOOL allowMultipleExpansion;

- (IBAction)switchDidChangeValue:(id)sender;

@end
