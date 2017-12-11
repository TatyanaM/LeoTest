//
//  BaseTranslateOperation.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 11/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "BaseTranslateOperation.h"

@implementation BaseTranslateOperation

-(id)initWithText:(NSString *)text
{
	self = [super init];
	if (self) {
		_text = [text copy];
	}
	return self;
}


-(BOOL)isConcurrent
{
	return YES;
}


@end
