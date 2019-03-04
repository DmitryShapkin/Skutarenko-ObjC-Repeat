//
//  ViewController.m
//  SK-Lesson-3
//
//  Created by Dmitry Shapkin on 03/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize lastname = _lastname;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.blueColor;
    
    NSLog(@"viewDidLoad");
    self.lastname = @"Dmitry";
    NSLog(@"%@", self.lastname);
    
}

- (void)setLastname:(NSString *)lastname {
    _lastname = [NSString stringWithFormat:@"BLABLABLA: %@", lastname];
}

- (NSString *)lastname {
    return [NSString stringWithFormat:@"GETTER: %@", _lastname];
}

@end
