//
//  Word+CoreDataProperties.m
//  
//
//  Created by Tatiana Mudryak on 09.12.2017.
//
//

#import "Word+CoreDataProperties.h"

@implementation Word (CoreDataProperties)

+ (NSFetchRequest<Word *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Word"];
}

@dynamic translation;
@dynamic word;

@end
