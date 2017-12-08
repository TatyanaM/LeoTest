//
//  WordsStoreManager.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordsStoreManageDelegate <NSObject>

-(void)newWordAddedWithResult:(BOOL)result error:(NSString *)error;
-(void)vocabularyLoaded:(NSArray *)words;

@end

@interface WordsStoreManager : NSObject

@property (nonatomic, weak) id <WordsStoreManageDelegate> delegate;

-(void)addWord:(NSString *)text;
//+(NSArray *)createWordsWithData:(NSArray *)words;

-(void)fetchVocabulary;

@end
