//
//  AlertViewHelper.h
//  LeoTest
//
//  Created by Tatiana Mudryak on 10.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewHelper : NSObject

+ (UIAlertController *)alertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
