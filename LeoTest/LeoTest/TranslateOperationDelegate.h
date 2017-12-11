//
//  TranslateOperationDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 10.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол работы операции перевода текста
 */
@protocol TranslateOperationDelegate <NSObject>

@required

/**
 Вызывается в случае, если перевод не удался

 @param error описание ошибки
 */
- (void)translationFailedWithError:(NSString *)error;


/**
 Вызывается при успешном завершении перевода

 @param translations массив со словами - вариантами перевода
 */
- (void)translationFinishedWithResult:(NSArray *)translations;

@end
