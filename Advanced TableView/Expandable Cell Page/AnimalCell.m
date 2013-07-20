//
//  ExpandableCell.m
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "AnimalCell.h"

#define ANIMATION_DURATION .3
#define BOUNCE_ANIMATION_DURATION .15
#define BOUNCE_OFFSET 10

@implementation AnimalCell

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetected:)];
	[self.rightSwipeRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
	[self.contentView addGestureRecognizer:self.rightSwipeRecognizer];
	
	self.leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetected:)];
	[self.leftSwipeRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
	[self.actionView addGestureRecognizer:self.leftSwipeRecognizer];
}

- (void)setAnimal:(Animal *)animal {
	self.lblTitle.text = animal.title;
	self.txtInfo.text = animal.info;
	self.imgAnimalPhoto.image = [UIImage imageNamed:animal.imageName];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[self setHideActionView:!editing animated:animated];
	
	[super setEditing:editing animated:animated];
}

- (void)setHideActionView:(BOOL)hide animated:(BOOL)animated {
	float animationDuration = (animated) ? ANIMATION_DURATION : 0;
	float bounceAnimationDuration = (animated) ? BOUNCE_ANIMATION_DURATION : 0;
	__block CGRect actionViewFrame = self.actionView.frame;
	__block CGRect displayViewFrame = self.contentView.frame;
	
	if (hide) {
		[UIView animateWithDuration:animationDuration
						 animations:^{
							 actionViewFrame.origin.x = actionViewFrame.size.width * -1;
							 displayViewFrame.origin.x = 0;
							 
							 self.actionView.frame = actionViewFrame;
							 self.displayView.frame = displayViewFrame;
						 }completion:^(BOOL finished){
							 [self.actionView removeFromSuperview];
						 }];
	}
	else {
		[self addSubview:self.actionView];
		
		[UIView animateWithDuration:animationDuration
						 animations:^{
							 actionViewFrame.origin.x = (animated) ? BOUNCE_OFFSET : 0;
							 displayViewFrame.origin.x = displayViewFrame.size.width;
							 
							 self.actionView.frame = actionViewFrame;
							 self.displayView.frame = displayViewFrame;
						 }completion:^(BOOL finished){
							 [UIView animateWithDuration:bounceAnimationDuration animations:^{
								 actionViewFrame.origin.x = 0;
								 self.actionView.frame = actionViewFrame;
							 }];
						 }];
	}
}

- (void)swipeDetected:(UISwipeGestureRecognizer *)aSwipeRecognizer {
	if (aSwipeRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		[self.delegate animalCellDidEndEditMode:self];
	}
	else if (aSwipeRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		[self.delegate animalCellDidEnterEditMode:self];
	}
}

@end
