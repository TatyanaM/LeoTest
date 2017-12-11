//
//  WordsStoreManager.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

typedef void (^VocabularyCompletionHandler)(NSArray *vocabulary);
typedef void (^CreateWordCompletionHandler)(Word *word);

@protocol WordsStoreManagerDelegate;

/**
 Класс-менеджер хранения слов в базе данных
 */
@interface WordsStoreManager : NSObject

/**
 Сохраняет слово в базу данных

 @param text слово
 @param translations варианты перевода
 @param completionHandler сохраненное слово
 */
-(void)saveWord:(NSString *)text withTranslation:(NSArray *)translations andCompletionHandler:(CreateWordCompletionHandler)completionHandler;


/**
 Возвращает все слова из словаря

 @param completionHandler массив слов
 */
-(void)fetchVocabularyWithCompletionHandler:(VocabularyCompletionHandler)completionHandler;

@end
