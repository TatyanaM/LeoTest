//
//  TranslationManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TranslationManagerDelegate.h"
#import "OperationsManager.h"

typedef void (^ItemCompletionHandler)(id items, NSError *error);

@protocol TranslationManagerDelegate;

/**
 Класс-менеджер ответственный за процесс перевода текста
 */
@interface TranslationManager : NSObject <TranslateOperationDelegate>

@property (nonatomic, assign) id <TranslationManagerDelegate> delegate;

/**
 Запускает процесс перевода текста с заданным источником перевода

 @param text текста для перевода
 @param source источник перевода (Яндекс, Гугл, ...)
 */
-(void)translateWord:(NSString *)text withTranslationSource:(TranslationSource)source;

@end
