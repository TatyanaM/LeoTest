//
//  AddWordView.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 08/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "AddWordView.h"

@interface AddWordView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;


@end

@implementation AddWordView

-(void)awakeFromNib
{
	[super awakeFromNib];

}

- (IBAction)addButtonClicked
{
	if ([self.delegate respondsToSelector:@selector(addWord:)]) {
		[self.delegate addWord:self.wordTextField.text];
	}
}

#pragma mark - UITextFieldDelegate

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//	if (textField.text.length > 0)
//		self.addButton.enabled = YES;
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//	if (textField.text.length > 0)
//		self.addButton.enabled = YES;
//}
//
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//	return textField.text.length;
//}

@end
