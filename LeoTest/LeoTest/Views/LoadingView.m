//
//  LoadingView.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "LoadingView.h"

CGFloat const LoadingViewWidth = 200.0;
CGFloat const LoadingViewHeight = 60.0;

@interface LoadingView ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation LoadingView

-(instancetype)initWithView:(UIView *)view
{
    self = [super initWithFrame:CGRectMake(0, 0, LoadingViewWidth, LoadingViewHeight)];
    if (self)
    {
        self.hidden = YES;
        [view addSubview:self];
        [view bringSubviewToFront:self];
    }
    return self;
}

-(void)start
{
    self.hidden = NO;
    [self.spinner startAnimating];
}

-(void)stop
{
    self.hidden = YES;
	[self.spinner stopAnimating];
}

#pragma mark - Constraints

- (void)layoutSubviews
{
	[super layoutSubviews];
	self.layer.cornerRadius = 16.0;
    self.layer.borderWidth = 1.0;
    self.layer.backgroundColor = [UIColor lightTextColor].CGColor;
}

@end
