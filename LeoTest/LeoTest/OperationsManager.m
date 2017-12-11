//
//  OperationsManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "OperationsManager.h"
#import "YandexTranslateOperation.h"


@implementation OperationsManager

+ (instancetype)sharedManager
{
	static OperationsManager *sharedOperationsManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedOperationsManager = [OperationsManager new];
	});
	return sharedOperationsManager;
}

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_operationsQueue = [NSOperationQueue new];
		_operationsQueue.name = @"Base.OperationsQueue";
	}

	return self;
}

- (id<TranslateOperationDelegate>)operationForTranslationSource:(TranslationSource)source andText:(NSString *)text
{
    id operation = nil;
    switch (source) {
        case YandexTranslator:
            operation = [[YandexTranslateOperation alloc] initWithText:text];
            break;
            
        case GoogleTranslator:
            break;
    }
    return operation;
}

@end
