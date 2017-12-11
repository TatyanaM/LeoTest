//
//  WordsStoreManager.m
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "WordsStoreManager.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation WordsStoreManager

- (void)saveWord:(NSString *)text withTranslation:(NSArray *)translations andCompletionHandler:(CreateWordCompletionHandler)completionHandler;
{
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@", text];
	Word *newWord = [Word MR_findFirstWithPredicate:predicate inContext:ManagedObjectContext];
	if (!newWord) {
		[ManagedObjectContext MR_saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
			Word *localWord = [Word MR_createEntityInContext:localContext];
			localWord.word = text;
			NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:translations];
			localWord.translations = arrayData;
		} completion:^(BOOL contextDidSave, NSError * _Nullable error) {
			Word *newWord = [Word MR_findFirstWithPredicate:predicate inContext:ManagedObjectContext];
			completionHandler(newWord);
		}];
	} else {
		completionHandler(newWord);
	}
}

- (void)fetchVocabularyWithCompletionHandler:(VocabularyCompletionHandler)completionHandler
{
	[ManagedObjectContext performBlock:^{
		NSArray *privateObjects = [self entitiesInContext:ManagedObjectContext withPredicate:nil];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Word MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}

- (void)foundWord:(NSString *)wordString withCompletionHandler:(VocabularyCompletionHandler)completionHandler
{
	[ManagedObjectContext performBlock:^{
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word CONTAINS[cd] %@", wordString];
		NSArray *privateObjects = [self entitiesInContext:ManagedObjectContext withPredicate:predicate];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjects];
			NSArray *finalResults = [Word MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}

-(NSArray *)entitiesInContext:(NSManagedObjectContext *)context withPredicate:(NSPredicate *)predicate
{
	NSArray *privateObjects = nil;
	if (!predicate) {
		privateObjects = [Word MR_findAllInContext:ManagedObjectContext];
	} else {
		privateObjects = [Word MR_findAllWithPredicate:predicate inContext:ManagedObjectContext];
	}
	NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
	return privateObjectIDs;
}

@end
