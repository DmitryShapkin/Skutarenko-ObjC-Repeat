//
//  ViewController.m
//  SK-Lesson-24 UIView Drawings
//
//  Created by Dmitry Shapkin on 12/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"
#import "DSDrawingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.drawingView.backgroundColor = [UIColor blueColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.drawingView setNeedsDisplay];
}

@end
