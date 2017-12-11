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

- (void)addDelegate:(id<WordsStoreManageDelegate>)delegate
{
	[delegates addPointer:(__bridge void *)delegate];
}

- (void)removeDelegate:(id<WordsStoreManageDelegate>)delegate
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

- (BOOL)saveWord:(NSString *)text withTranslation:(NSString *)translation
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@", text];
    Word *newWord = [Word MR_findFirstWithPredicate:predicate inContext:ManagedObjectContext];
    if (!newWord) {
        newWord = [Word MR_createEntityInContext:ManagedObjectContext];
        newWord.word = text;
        newWord.translation = translation;
    }
    [ManagedObjectContext MR_saveToPersistentStoreAndWait];
    return YES;
}

- (void)fetchVocabulary
{
	NSArray *words = [Word MR_findAllInContext:ManagedObjectContext];
    [self callDelegateMethod:@selector(vocabularyLoaded:) withObject:words];
}

@end
