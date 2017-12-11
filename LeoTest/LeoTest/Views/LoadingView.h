//
//  LoadingView.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Вьха с индикатором загрузки
 */
@interface LoadingView : UIView

/**
 Инициализирует экземпляр LoadingView для указанного представления

 @param view представление, где будет отображаться LoadingView
 @return экземпляр LoadingView
 */
-(instancetype)initWithView:(UIView *)view;

/**
 Показать индикатор загрузки
 */
-(void)start;

/**
 Скрыть индикатор загрузки
 */
-(void)stop;

@end
