//
//  WordCell.h
//  LeoMini
//
//  Created by Tatiana Mudryak on 07/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const WordCellIdentifier;

/**
 Ячейка отображения слова из словаря
 */
@interface WordCell : UITableViewCell

@property (nonatomic, strong) NSString *word;
@property (nonatomic, strong) NSString *translation;

@end
