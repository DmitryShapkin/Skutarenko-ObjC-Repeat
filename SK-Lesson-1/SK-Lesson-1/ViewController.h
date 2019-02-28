//
//  ViewController.h
//  SK-Lesson-1
//
//  Created by Dmitry Shapkin on 28/02/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *actionStart;

- (IBAction)buttonTapped:(UIButton *)sender;

@end

