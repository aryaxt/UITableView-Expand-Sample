//
//  animalStorage.m
//  Advanced TableView
//
//  Created by Aryan Gh on 5/6/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "AnimalStorage.h"

@implementation AnimalStorage

/*
 References 
 http://en.wikipedia.org/wiki/List_of_dog_breeds
 http://en.wikipedia.org/wiki/Cat_breed#Breeds
*/

+ (NSArray *)allAnimals {
	NSMutableArray *result = [NSMutableArray array];
	[result addObjectsFromArray:[AnimalStorage dogs]];
	[result addObjectsFromArray:[AnimalStorage cats]];
	return result;
}

+ (NSArray *)dogs {
	Animal *animal = [[Animal alloc] init];
	animal.title = @"American Eskimo";
	animal.imageName = @"americanEskimo.jpg";
	animal.info = @"The American Eskimo Dog is a breed of companion dog originating in Germany. The American Eskimo is a member of the Spitz family. Despite its name and appearance, the American Eskimo dog is not from Alaska; the dog's heritage is traced back to Northern Europe. The breed's progenitors were German Spitz, but due to anti-German prejudice during the First World War, it was renamed 'American Eskimo Dog'. Although modern American Eskimos have been exported as German Spitz Gross (or Mittel, depending on the dog's height), the breed standards are actually significantly different. In addition to serving as a watchdog and companion, the American Eskimo dog also achieved a high degree of popularity in the 1930s and 1940s United States as a circus performer.";
	
	Animal *animal2 = [[Animal alloc] init];
	animal2.title = @"Catalan Sheepdog";
	animal2.imageName = @"catalanSheepDog.jpg";
	animal2.info = @"Catalan sheepdogs range in size from 17 to 19 in (45 to 55 cm) in height and 60 to 80 lb (20 to 27 kg) in weight for males, with females being smaller. Their coat is long and either flat or slightly wavy, and ranges from fawn to dark sable and light to dark grey. There is also a short-haired version of this breed, but is nearly extinct";
	
	Animal *animal3 = [[Animal alloc] init];
	animal3.title = @"Pomeranian";
	animal3.imageName = @"pomeranian.jpg";
	animal3.info = @"The Pomeranian (often known as a Pom or Pom Pom) is a breed of dog of the Spitz type, named for the Pomerania region in Central Europe (today part of northern Poland and eastern Germany). Classed as a toy dog breed because of its small size, the Pomeranian is descended from the larger Spitz type dogs, specifically the German Spitz. It has been determined by the Fédération Cynologique Internationale to be part of the German Spitz breed, and in many countries, they are known as the Zwergspitz (Dwarf Spitz).";
	
	
	return @[animal, animal2, animal3];
}

+ (NSArray *)cats {
	Animal *animal = [[Animal alloc] init];
	animal.title = @"Abyssinian";
	animal.imageName = @"abyssinian.jpg";
	animal.info = @"The name 'Abyssinian' refers to Ethiopia, but most of the stories about the origins of Abyssinians refer to Egypt. Genetic research suggests the breed originated near the coast of the Indian Ocean, where colonists may have purchased animals from wild animal traders. The breed was developed in Great Britain";
	
	Animal *animal2 = [[Animal alloc] init];
	animal2.title = @"AmericanCurl";
	animal2.imageName = @"american-Curl.jpg";
	animal2.info = @"The American Curl is a breed of cat characterized by its unusual ears, which curl back from the face toward the center of the back of the skull. An American Curl's ears should be handled carefully because rough handling may damage the cartilage in the ear. The breed originated in Lakewood, California, as the result of a spontaneous mutation.[1] In June 1981, two stray kittens were found and taken in by the Ruga family. The kittens were both longhaired, one black and the other black and white. The family named them Shulamith and Panda respectively, but Panda disappeared several weeks later, making Shulamith the foundation female of the American Curl breed";
	
	Animal *animal3 = [[Animal alloc] init];
	animal3.title = @"Persian";
	animal3.imageName = @"persian.jpg";
	animal3.info = @"The Persian is a long-haired breed of cat characterized by its round face and shortened muzzle. Its name refers to Persia, the former name of Iran, where similar cats are found.[dubious – discuss] Recognized by the cat fancy since the late 19th century, it was developed first by the English, and then mainly by American breeders after the Second World War. In Britain, it is called the Longhair or Persian Longhair. The selective breeding carried out by breeders has allowed the development of a wide variety of coat colors, but has also led to the creation of increasingly flat-faced Persians.";
	
	
	return @[animal, animal2, animal3];
}

+ (NSArray *)animalCategories {
	AnimalCategory *category = [[AnimalCategory alloc] init];
	category.name = @"Dog";
	category.breeds = [AnimalStorage dogs];
	
	AnimalCategory *category2 = [[AnimalCategory alloc] init];
	category2.name = @"Cat";
	category2.breeds = [AnimalStorage cats];
	
	return @[category, category2];
}

@end
