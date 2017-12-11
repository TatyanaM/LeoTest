//
//  WordsTableViewDataSource.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Источник данных для таблицы отображения словаря
 */
@interface WordsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *words;

@end
