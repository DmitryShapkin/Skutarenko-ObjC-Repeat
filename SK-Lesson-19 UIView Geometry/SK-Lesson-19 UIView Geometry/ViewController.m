//
//  ViewController.m
//  SK-Lesson-19 UIView Geometry
//
//  Created by Dmitry Shapkin on 11/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 50, 100)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:view2];
    
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self.view bringSubviewToFront:view2];
    
    UIView* view21 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 50)];
    view21.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];
    [view2 addSubview:view21];
    
    self.testView = view2;

    NSLog(@"%@", self.view.subviews);
    NSLog(@"%ld", [self.view.subviews indexOfObject:view1]);
    NSLog(@"%ld", [self.view.subviews indexOfObject:view2]);
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    // NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.testView.frame), NSStringFromCGRect(self.testView.bounds));
    
    NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
    
    CGPoint origin = self.testView.frame.origin;
    
    NSLog(@"CG: %@", NSStringFromCGPoint(origin));
    
    origin = [self.view convertPoint:origin toView:self.view.window];
    
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


@end
