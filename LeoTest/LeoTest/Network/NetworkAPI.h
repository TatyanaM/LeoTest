//
//  NetworkAPI.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseCompletionHandler)(id item, NSError *error);

/**
 Класс для отправки сетевых запросов
 */
@interface NetworkAPI : NSObject

/**
 Создает экземпляр Network API с заданным запросом

 @param request URL запрос
 @return экземпляр Network API
 */
-(instancetype)initWithRequest:(NSURLRequest *)request;


/**
 Отправляет синхронный запрос

 @param urlString URL строка запроса
 @param params параметры (опционально)
 @return ответ сервера
 */
+(id)startSyncLoadingWithURL:(NSString *)urlString params:(NSDictionary *)params;

@end
