//
//  WordsSearchManager.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 08.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordsSearchManagerDelegate.h"

@protocol WordsSearchManagerDelegate;

/**
 Менеджер для поиска слов
 */
@interface WordsSearchManager : NSObject

@property (nonatomic, weak) id <WordsSearchManagerDelegate> delegate;

@end
