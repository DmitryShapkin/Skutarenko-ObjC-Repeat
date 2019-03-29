//
//  ViewController.h
//  SK-Lesson-26 Controls
//
//  Created by Dmitry Shapkin on 29/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UISlider *redComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl* colorSchemeControl;


- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionEnable:(UISwitch *)sender;

@end

