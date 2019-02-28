//
//  ViewController.m
//  SK-Lesson-1
//
//  Created by Dmitry Shapkin on 28/02/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *someString = @"Dmitry";
    self.actionStart.backgroundColor = UIColor.redColor;
}


- (IBAction)buttonTapped:(UIButton *)sender {
    NSLog(@"buttonTapped");
    
    if ([self.actionStart respondsToSelector:@selector(setTitle:)]) {
        NSLog(@"RESPONDS");
    }
}
@end
