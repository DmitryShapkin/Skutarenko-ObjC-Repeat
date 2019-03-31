//
//  ViewController.h
//  SK-Lesson-30 UITableView Dynamic Cells
//
//  Created by Dmitry Shapkin on 31/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

