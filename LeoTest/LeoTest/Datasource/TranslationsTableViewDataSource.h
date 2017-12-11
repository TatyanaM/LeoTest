//
//  TranslationsTableViewDataSource.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 09.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TranslationsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *translations;

@end
