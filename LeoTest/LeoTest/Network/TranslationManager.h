//
//  TranslationManager.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationsManager.h"

typedef void (^ItemCompletionHandler)(id items, NSError *error);

@protocol TranslationManagerDelegate <NSObject>
@required
-(void)translationFinishedWithError:(NSString *)error;
-(void)translationsLoaded:(NSArray *)translations;

@end

@interface TranslationManager : NSObject <TranslateOperationDelegate>

@property (nonatomic, assign) id <TranslationManagerDelegate> delegate;

-(void)translateWord:(NSString *)text withTranslationSource:(TranslationSource)source;

@end
