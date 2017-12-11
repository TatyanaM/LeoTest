//
//  WordCell.m
//  LeoMini
//
//  Created by Tatiana Mudryak on 07/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "WordCell.h"

NSString *const WordCellIdentifier = @"WordCellIdentifier";

@implementation WordCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
	self.textLabel.font = [UIFont fontWithName:@"Helvetica Neue LT Std Thin" size:14];
	self.detailTextLabel.font = [UIFont fontWithName:@"Helvetica Neue LT Pro-Medium" size:12];
}

-(void)setWord:(NSString *)word
{
	_word = word;
	self.textLabel.text = _word;
}

-(void)setTranslation:(NSString *)translation
{
	_translation = translation;
	self.detailTextLabel.text = translation;
}



@end
