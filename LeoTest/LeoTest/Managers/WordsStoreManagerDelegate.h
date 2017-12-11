//
//  WordsStoreManagerDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 11/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordsStoreManagerDelegate <NSObject>

@optional
-(void)newWordAddedWithResult:(BOOL)result error:(NSString *)error;
-(void)vocabularyLoaded:(NSArray *)words;

@end

