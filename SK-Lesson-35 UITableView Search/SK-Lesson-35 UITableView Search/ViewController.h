//
//  ViewController.h
//  SK-Lesson-35
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UITableViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar* searchBar;

@end
