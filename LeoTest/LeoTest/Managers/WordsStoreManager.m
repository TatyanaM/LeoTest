//
//  WordsStoreManager.m
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "WordsStoreManager.h"
#import <MagicalRecord/MagicalRecord.h>

@interface WordsStoreManager ()

@property (nonatomic, strong, readwrite) NSPointerArray *delegates;

@end

@implementation WordsStoreManager

@synthesize delegates;

- (instancetype)init
{
	self = [super init];
	if (self) {
        delegates = [NSPointerArray pointerArrayWithOptions:NSPointerFunctionsWeakMemory];
	}
	return self;
}

- (void)addDelegate:(id<WordsStoreManagerDelegate>)delegate
{
	[delegates addPointer:(__bridge void *)delegate];
}

- (void)removeDelegate:(id<WordsStoreManagerDelegate>)delegate
{
    // Remove the pointer from the array
    for (int i=0; i < delegates.count; i++) {
        if (delegate == [delegates pointerAtIndex: i]) {
            [delegates removePointerAtIndex: i];
            break;
        }
    }
}

- (void)callDelegateMethod:(SEL)selector withObject:(id)object
{
    for (id delegate in delegates)
    {
        if ([delegate respondsToSelector:@selector(selector)]) {
            NSMethodSignature * mySignature = [delegate methodSignatureForSelector:selector];
            NSInvocation * myInvocation = [NSInvocation
                                           invocationWithMethodSignature:mySignature];
            myInvocation.target = delegate;
            myInvocation.selector = selector;
            [myInvocation invoke];
        }
            //[delegate performSelector:selector withObject:object];
    }
}


#pragma mark - Actions

- (Word *)saveWord:(NSString *)text withTranslation:(NSArray *)translations
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@", text];
    Word *newWord = [Word MR_findFirstWithPredicate:predicate inContext:ManagedObjectContext];
    if (!newWord) {
        newWord = [Word MR_createEntityInContext:ManagedObjectContext];
        newWord.word = text;
		NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:translations];
        newWord.translations = arrayData;
    }
    [ManagedObjectContext MR_saveToPersistentStoreAndWait];
    return newWord;
}

- (void)fetchVocabulary
{
	NSArray *words = [Word MR_findAllInContext:ManagedObjectContext];
    [self callDelegateMethod:@selector(vocabularyLoaded:) withObject:words];
}

@end
