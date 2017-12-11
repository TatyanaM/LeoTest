//
//  TranslationManager.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "TranslationManager.h"
#import "BaseTranslateOperation.h"
#import "WordsStoreManager.h"
#import "OperationsManager.h"

static NSString *const wrongDataFormatError = @"Ошибка загрузки данных";

@interface TranslationManager ()


@end

@implementation TranslationManager

-(void)translateWord:(NSString *)text withTranslationSource:(TranslationSource)source
{
    BaseTranslateOperation *operation = (id)[[OperationsManager sharedManager] operationForTranslationSource:source andText:text];
    operation.delegate = self;
	[[OperationsManager sharedManager].operationsQueue addOperation:operation];
}


#pragma mark - TranslateOperationDelegate

-(void)translationFailedWithError:(NSString *)error
{
	dispatch_async(dispatch_get_main_queue(), ^{
		if ([self.delegate respondsToSelector:@selector(translationFinishedWithError:)])
			[self.delegate translationFinishedWithError:error];
	});
}

-(void)translationFinishedWithResult:(NSArray *)translations
{
	dispatch_async(dispatch_get_main_queue(), ^{
		if ([self.delegate respondsToSelector:@selector(translationsLoaded:)])
			[self.delegate translationsLoaded:translations];
	});
}

@end
