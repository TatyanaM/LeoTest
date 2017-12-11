//
//  OperationsManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 06/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TranslateOperationDelegate.h"

typedef enum TranslationSource  {
    YandexTranslator,
    GoogleTranslator
} TranslationSource;

/**
 Менеджер управления операциями перевода текста
 */
@interface OperationsManager : NSObject

/**
 Очередь операций
 */
@property (nonatomic, strong) NSOperationQueue *operationsQueue;

+ (instancetype)sharedManager;

/**
 Фабрика создания операций в зависимости от указанного источника перевода

 @param source источник перевода
 @param text текст для перевода
 @return экземпляр операции нужного типа
 */
- (id <TranslateOperationDelegate>)operationForTranslationSource:(TranslationSource)source andText:(NSString *)text;

@end
