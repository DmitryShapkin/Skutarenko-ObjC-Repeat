//
//  ViewController.h
//  SK-Lesson-25 UIButton
//
//  Created by Dmitry Shapkin on 28/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;

- (IBAction)actionTest2:(UIButton *)sender;
- (IBAction)actionTest2TouchDown:(UIButton *)sender;

@end

