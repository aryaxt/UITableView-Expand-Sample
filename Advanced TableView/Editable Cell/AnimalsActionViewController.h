//
//  MoviesActionViewController.h
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalCell.h"
#import "AnimalStorage.h"

@interface AnimalsActionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AnimalCellDelegate>

@property (nonatomic, strong) IBOutlet UITableView *table;
@property (nonatomic, strong) NSIndexPath *indexPathOfEditingCell;
@property (nonatomic, strong) NSArray *animals;

@end
