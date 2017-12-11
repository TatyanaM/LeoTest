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

@interface OperationsManager : NSObject

@property (nonatomic, strong) NSOperationQueue *operationsQueue;

+ (instancetype)sharedManager;
- (id <TranslateOperationDelegate>)operationForTranslationSource:(TranslationSource)source andText:(NSString *)text;

@end
