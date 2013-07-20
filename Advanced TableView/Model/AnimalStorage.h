//
//  MovieStorage.h
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "AnimalCategory.h"

@interface AnimalStorage : NSObject

+ (NSArray *)allAnimals;
+ (NSArray *)cats;
+ (NSArray *)dogs;
+ (NSArray *)animalCategories;

@end
