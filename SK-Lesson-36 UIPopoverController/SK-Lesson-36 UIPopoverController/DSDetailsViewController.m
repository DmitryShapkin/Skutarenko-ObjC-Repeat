//
//  DSDetailsViewController.m
//  SK-Lesson-36 UIPopoverController
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "DSDetailsViewController.h"


@interface DSDetailsViewController ()

@end


@implementation DSDetailsViewController

- (void) dealloc
{
    NSLog(@"Details deallocated");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.bgColor)
    {
        self.view.backgroundColor = self.bgColor;
    }
}

@end
