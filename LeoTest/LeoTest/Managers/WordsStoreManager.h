//
//  WordsStoreManager.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordsStoreManagerDelegate.h"
#import "Word.h"

@protocol WordsStoreManagerDelegate;

/**
 Класс-менеджер хранения слов в базе данных
 */
@interface WordsStoreManager : NSObject

/**
 Добавить делегат

 @param delegate добавляемый обьект-делегат, поддерживающий протокол WordsStoreManageDelegate
 */
- (void)addDelegate:(id<WordsStoreManagerDelegate>)delegate;

/**
 Удалить делегат

 @param delegate удаляемый обьект-делегат, поддерживающий протокол WordsStoreManageDelegate
 */
- (void)removeDelegate:(id<WordsStoreManagerDelegate>)delegate;


/**
 Сохраняет слово в БД

 @param text слово
 @param translations варианты переводов
 @return добавленное слово, экземпляр Word
 */
-(Word *)saveWord:(NSString *)text withTranslation:(NSArray *)translations;

/**
 Получить все слова из словаря
 */
-(void)fetchVocabulary;

@end
