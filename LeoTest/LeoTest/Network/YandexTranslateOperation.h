//
//  YandexTranslateOperation.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "BaseTranslateOperation.h"


/**
 Операция для перевода слова через Yandex
 */
@interface YandexTranslateOperation : BaseTranslateOperation

/**
 Создает операцию перевода слова

 @param text слово для перевода
 @return экземпляр YandexTranslateOperation
 */
-(instancetype)initWithText:(NSString *)text;


@end
