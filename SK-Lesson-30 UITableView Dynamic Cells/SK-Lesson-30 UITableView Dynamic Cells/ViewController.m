//
//  ViewController.m
//  SK-Lesson-30 UITableView Dynamic Cells
//
//  Created by Dmitry Shapkin on 31/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection %ld", section);
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    return [fontNames count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath: {%ld, %ld}", indexPath.section, indexPath.row);
    static NSString* indentifier = @"Cell";
    indentifier = @"sdfs";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        NSLog(@"cell created");
    }
    else
    {
        NSLog(@"cell reused");
    }
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    cell.textLabel.text = fontName;
    UIFont* font = [UIFont fontWithName:fontName size:16];
    cell.textLabel.font = font;
    
    return cell;
}

@end
