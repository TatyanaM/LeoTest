//
//  WordsStoreManager.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordsStoreManageDelegate <NSObject>

@optional
-(void)newWordAddedWithResult:(BOOL)result error:(NSString *)error;
-(void)vocabularyLoaded:(NSArray *)words;

@end

/**
 Класс-менеджер хранения слов в базе данных
 */
@interface WordsStoreManager : NSObject

/**
 Добавить делегат

 @param delegate добавляемый обьект-делегат, поддерживающий протокол WordsStoreManageDelegate
 */
- (void)addDelegate:(id<WordsStoreManageDelegate>)delegate;

/**
 Удалить делегат

 @param delegate удаляемый обьект-делегат, поддерживающий протокол WordsStoreManageDelegate
 */
- (void)removeDelegate:(id<WordsStoreManageDelegate>)delegate;


-(BOOL)saveWord:(NSString *)text withTranslation:(NSString *)translation;

/**
 Получить все слова из словаря
 */
-(void)fetchVocabulary;

@end
