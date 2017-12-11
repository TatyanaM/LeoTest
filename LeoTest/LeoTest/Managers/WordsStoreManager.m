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
	NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
	[privateContext performBlock:^{
		NSArray *privateObjects = [Word MR_findAllInContext:privateContext];
		NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
			NSArray *finalResults = [Word MR_findAllWithPredicate:mainPredicate];
			completionHandler(finalResults);
		});
	}];
}

@end
