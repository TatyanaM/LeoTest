//
//  BaseTranslateOperation.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 11/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TranslateOperationDelegate.h"

@protocol TranslateOperationDelegate;

/**
 Базовый класс для операций перевода текста
 */
@interface BaseTranslateOperation : NSOperation

@property (nonatomic, weak) id <TranslateOperationDelegate> delegate;

/**
 Текст для перевода
 */
@property (nonatomic, strong) NSString *text;

/**
 Создает операцию перевода текста

 @param text текст для перевода
 @return экземпляр YandexTranslateOperation
 */
-(instancetype)initWithText:(NSString *)text;


@end
