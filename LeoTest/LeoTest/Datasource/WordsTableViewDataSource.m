//
//  WordsTableViewDataSource.m
//  LeoMini
//
//  Created by Tatiana Mudryak on 05/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "WordsTableViewDataSource.h"
#import "WordCell.h"
#import "Word.h"

@implementation WordsTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	WordCell *newCell = [tableView dequeueReusableCellWithIdentifier:WordCellIdentifier];
	if (!newCell)
	{
		newCell = [[WordCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:WordCellIdentifier];
	}

	Word *word = [self.words objectAtIndex:indexPath.row];
	newCell.word = word.word;
	NSArray *arrayOfTranslations = [NSKeyedUnarchiver unarchiveObjectWithData:word.translations];
	newCell.translation = [arrayOfTranslations componentsJoinedByString:@","];
	return newCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.words.count;
}

@end
