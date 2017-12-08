//
//  LoadingView.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "LoadingView.h"

CGFloat const LoadingViewSideElementOffset = 16.0;

@interface LoadingView ()

@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation LoadingView

+ (instancetype)loadingViewWithMessage:(NSString *)message
{
	return [[LoadingView alloc] initWithMessage:message];
}

- (LoadingView *)initWithMessage:(NSString *)message
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor whiteColor];

		_spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[_spinner startAnimating];
		[self addSubview:_spinner];

		_textLabel = [UILabel new];
		_textLabel.text = message;
		[self addSubview:_textLabel];
	}
	return self;
}

-(void)dealloc
{
	[_spinner stopAnimating];
}

#pragma mark - Constraints

- (void)updateConstraints
{
	[_spinner mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self);
		make.left.equalTo(@(LoadingViewSideElementOffset));
	}];
	[_textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self);
		make.right.equalTo(@(LoadingViewSideElementOffset));
		make.left.equalTo(_spinner.mas_right).offset(LoadingViewSideElementOffset);
	}];
	[super updateConstraints];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	self.layer.cornerRadius = 16.0;
}

@end
