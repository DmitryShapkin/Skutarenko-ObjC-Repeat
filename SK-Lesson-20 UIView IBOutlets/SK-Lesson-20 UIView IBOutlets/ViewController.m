//
//  ViewController.m
//  SK-Lesson-20 UIView IBOutlets
//
//  Created by Dmitry Shapkin on 11/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton* myButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", self.arrayViews);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    self.testView.backgroundColor = [self randomColor];
    
    self.myButton.backgroundColor = [self randomColor];
    
    // NSLog(@"%@", self.arrayViews);
    
    for (UIView* view in self.arrayViews) {
            view.backgroundColor = [self randomColor];
    }
}

- (CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256) / 255;
}

- (UIColor*) randomColor {
    
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
