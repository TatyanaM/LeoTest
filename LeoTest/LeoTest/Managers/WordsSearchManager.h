//
//  WordsSearchManager.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 08.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordsSearchManageDelegate <NSObject>

-(void)wordsFound:(NSArray *)words;

@end

@interface WordsSearchManager : NSObject

@property (nonatomic, weak) id <WordsSearchManageDelegate> delegate;

@end
