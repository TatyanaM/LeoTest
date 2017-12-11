//
//  WordsTableViewDataSource.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *words;

@end
