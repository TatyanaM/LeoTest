//
//  TranslationManagerDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 11/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол менеджера перевода текста
 */
@protocol TranslationManagerDelegate <NSObject>
@required

/**
 Перевод был завершен с ошибкой

 @param error описание ошибки
 */
-(void)translationFinishedWithError:(NSString *)error;


/**
 Перевод завершен успешно

 @param translations массив слов-вариантов перевода
 */
-(void)translationsLoaded:(NSArray *)translations;

@end
