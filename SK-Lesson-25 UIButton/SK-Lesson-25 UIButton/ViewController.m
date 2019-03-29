//
//  ViewController.m
//  SK-Lesson-25 UIButton
//
//  Created by Dmitry Shapkin on 28/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 200);
    button.backgroundColor = [UIColor lightGrayColor];
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30.f],
//                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
//
//    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
//
//    [button setAttributedTitle:title forState:UIControlStateNormal];
//
//    NSDictionary *attributes2 = @{NSFontAttributeName: [UIFont systemFontOfSize:20.f],
//                                  NSForegroundColorAttributeName: [UIColor redColor]};
//
//    NSAttributedString* title2 = [[NSAttributedString alloc] initWithString:@"Button Pressed" attributes:attributes2];
//
//    [button setAttributedTitle:title2 forState:UIControlStateHighlighted];
    
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 0, 0);
//    button.titleEdgeInsets = insets;
    
    [button addTarget:self action:@selector(actionTest:event:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpOutside];
    
//    [self.view addSubview:button];
}


#pragma mark - Actions

- (void)actionTest:(UIButton*) button event:(UIEvent*) event
{
    NSLog(@"Button pressed");
    NSLog(@"%@", event);
}

- (void)actionTestOutside:(UIButton*) button
{
    NSLog(@"Button pressed Outside");
    NSLog(@"%@", NSStringFromCGRect(button.bounds));
}

- (IBAction)actionTest2:(UIButton *)sender
{
    NSLog(@"actionTest2 tag = %ld", sender.tag);
    self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", sender.tag];
}

- (IBAction)actionTest2TouchDown:(UIButton *)sender
{
    NSLog(@"actionTest2TouchDown");
}

@end
