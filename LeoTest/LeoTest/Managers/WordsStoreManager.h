//
//  WordsStoreManager.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordsStoreManageDelegate <NSObject>

@optional
-(void)newWordAddedWithResult:(BOOL)result error:(NSString *)error;
-(void)vocabularyLoaded:(NSArray *)words;

@end

@interface WordsStoreManager : NSObject

- (void)addDelegate:(id<WordsStoreManageDelegate>)delegate;
- (void)removeDelegate:(id<WordsStoreManageDelegate>)delegate;

-(BOOL)saveWord:(NSString *)text withTranslation:(NSString *)translation;
-(void)fetchVocabulary;

@end
