//
//  WordsStoreManager.m
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "WordsStoreManager.h"
#import "Word+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>

@interface WordsStoreManager ()

@property (nonatomic, strong, readwrite) NSMutableArray *delegates;

@end

@implementation WordsStoreManager

@synthesize delegates;

+ (WordsStoreManager *)sharedStoreManager
{
	static dispatch_once_t onceToken;
	static WordsStoreManager *sharedManager = nil;
	dispatch_once(&onceToken, ^{
		sharedManager = [[WordsStoreManager alloc] init];
	});
	return sharedManager;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		delegates = [NSMutableArray new];
	}
	return self;
}
- (void)addDelegate:(id<WordsStoreManageDelegate>)delegate
{
	NSValue *value = [NSValue valueWithNonretainedObject:delegate];
	[delegates addObject:value];
}

- (void)removeDelegate:(id<WordsStoreManageDelegate>)delegate
{
	[delegates removeAllObjects];
}

-(void)addWord:(NSString *)text
{
	[MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@", text];
		Word *newWord = [Word MR_findFirstWithPredicate:predicate inContext:localContext];
		if (!newWord) {
			newWord = [Word MR_createEntityInContext:localContext];
			newWord.word = text;
		}
	} completion:^(BOOL contextDidSave, NSError * _Nullable error) {
		if ([self.delegate respondsToSelector:@selector(newWordAddedWithResult:error:)]) {
			[self.delegate newWordAddedWithResult:contextDidSave error:error.description];
		}
	}];
}


+(NSArray *)createWordsWithData:(NSArray *)words
{
	NSMutableArray *parsedWords = [NSMutableArray new];
	for (NSDictionary *info in words)
	{
		Word *word = [Word MR_createEntityInContext:ManagedObjectContext];
		NSString *keyValue = nil;
		for (NSString *key in info) {
			keyValue = key;
			if ([keyValue isEqualToString:@"description"]) {
				keyValue = @"itemDescription";
			}

			if ([word respondsToSelector:NSSelectorFromString(keyValue)]) {
				[word setValue:info[key] forKey:keyValue];
			}
		}
		[parsedWords addObject:word];
	}

	return [parsedWords copy];
}

-(void)fetchVocabulary
{
	NSArray *words = [Word MR_findAllInContext:ManagedObjectContext];
	if ([self.delegate respondsToSelector:@selector(vocabularyLoaded:)]) {
		[self.delegate vocabularyLoaded:words];
	}
}

@end
