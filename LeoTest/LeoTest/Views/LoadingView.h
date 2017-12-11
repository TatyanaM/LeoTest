//
//  LoadingView.h
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

-(instancetype)initWithView:(UIView *)view;
-(void)start;
-(void)stop;

@end
