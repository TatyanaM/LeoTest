//
//  TranslateOperationDelegate.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 10.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TranslateOperationDelegate <NSObject>

@required
- (void)translationFailedWithError:(NSString *)error;
- (void)translationFinishedWithResult:(NSArray *)translations;

@end
