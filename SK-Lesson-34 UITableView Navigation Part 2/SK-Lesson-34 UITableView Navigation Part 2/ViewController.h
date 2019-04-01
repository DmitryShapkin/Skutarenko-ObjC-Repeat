//
//  ViewController.h
//  SK-Lesson-34 UITableView Navigation Part 2
//
//  Created by Dmitry Shapkin on 01/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UITableViewController

@property (strong, nonatomic) NSString* path;

- (id)initWithFolderPath:(NSString*)path;
- (IBAction)actionInfoCell:(id)sender;

@end

