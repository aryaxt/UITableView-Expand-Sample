//
//  ExpandableCell.h
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animal.h"

@class AnimalCell;
@protocol AnimalCellDelegate <NSObject>
- (void)animalCellDidEnterEditMode:(AnimalCell *)cell;
- (void)animalCellDidEndEditMode:(AnimalCell *)cell;
@end

@interface AnimalCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) IBOutlet UITextView *txtInfo;
@property (nonatomic, strong) IBOutlet UIImageView *imgAnimalPhoto;
@property (nonatomic, strong) IBOutlet UIView *actionView;
@property (nonatomic, strong) IBOutlet UIView *displayView;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeRecognizer;
@property (nonatomic, weak) id <AnimalCellDelegate> delegate;

- (void)setAnimal:(Animal *)animal;

@end
