//
//  TranslateOperationDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 10.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол работы операции перевода слова
 */
@protocol TranslateOperationDelegate <NSObject>

@required
/**
 Сообщает о том, что перевод не удался

 @param error описание ошибки
 */
- (void)translationFailedWithError:(NSString *)error;


/**
 Сообщает об успешном завершении перевода

 @param translations массив с словами - вариантами перевода
 */
- (void)translationFinishedWithResult:(NSArray *)translations;

@end
