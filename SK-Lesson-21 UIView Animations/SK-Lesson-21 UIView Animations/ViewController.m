//
//  ViewController.m
//  SK-Lesson-21 UIView Animations
//
//  Created by Dmitry Shapkin on 11/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) UIView* testView;

@property (weak, nonatomic) UIImageView* testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor clearColor];
    
    UIImage* image1 = [UIImage imageNamed:@"1.png"];
    UIImage* image2 = [UIImage imageNamed:@"2.png"];
    UIImage* image3 = [UIImage imageNamed:@"3.png"];
    
    NSArray* images = [NSArray arrayWithObjects:image1, image2, image1, image3, nil];
    
    view.animationImages = images;
    view.animationDuration = 1.f;
    [view startAnimating];
    
    [self.view addSubview:view];
    
    //self.testView = view;
    self.testImageView = view;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Just move to annother point
    
//    [UIView animateWithDuration:2 animations:^{
//        self.testImageView.center = CGPointMake(200, 200);
//    }];
    
    [self moveView:self.testImageView];
    
}

- (void) moveView:(UIView*) view {
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    // here is runtime error:
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat s = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI * 2*10000)) / 10000 - M_PI;
    
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"\nview frame = %@\nview bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* v = view;
                         [self moveView:v];
                     }];
}

- (UIColor*) randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


@end
