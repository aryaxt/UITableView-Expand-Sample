//
//  ExpandableCellViewController.h
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalCell.h"
#import "AnimalStorage.h"

@interface AnimalsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSIndexPath *expandedIndexPath;
@property (nonatomic, strong) NSArray *animals;

@end
