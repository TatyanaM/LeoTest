//
//  WordsSearchManageDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 11/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол поиска слов
 */
@protocol WordsSearchManagerDelegate <NSObject>

/**
 Возвращает массив найденных слов

 @param words массив слов
 */
-(void)wordsFound:(NSArray *)words;

@end
