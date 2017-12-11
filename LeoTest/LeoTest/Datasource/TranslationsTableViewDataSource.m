//
//  TranslationsTableViewDataSource.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 09.12.2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "TranslationsTableViewDataSource.h"

@implementation TranslationsTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!newCell)
    {
        newCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    newCell.textLabel.text = [self.translations objectAtIndex:indexPath.row];
    return newCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.translations.count;
}

@end
