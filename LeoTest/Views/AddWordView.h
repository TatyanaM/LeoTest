//
//  AddWordView.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 08/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddWordViewDelegate.h"

@protocol AddWordViewDelegate;

@interface AddWordView : UIView

@property (nonatomic, weak) id <AddWordViewDelegate> delegate;

@end
