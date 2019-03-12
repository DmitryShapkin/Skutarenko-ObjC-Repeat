//
//  ViewController.m
//  SK-Lesson-23 Gestures
//
//  Created by Dmitry Shapkin on 12/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIView* testView;

@property (assign, nonatomic) CGFloat testViewScale;
@property (assign, nonatomic) CGFloat testViewRotation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50,
                                                            CGRectGetMidY(self.view.bounds) - 50,
                                                            100, 100)];
    
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
    
    self.testView = view;
    
    // tapGesture
    
    UITapGestureRecognizer* tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    // doubleTapGesture
    
    UITapGestureRecognizer* doubleTapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTap:)];
    
    doubleTapGesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:doubleTapGesture];
    
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture]; // waiting for finish single-tap
    
    // doubleTapDoubleTouchGesture
    
    UITapGestureRecognizer* doubleTapDoubleTouchGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTapDoubleTouch:)];
    
    doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
    
    [self.view addGestureRecognizer:doubleTapDoubleTouchGesture];
    
    // pinchGesture
    
    UIPinchGestureRecognizer* pinchGesture =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    
    [self.view addGestureRecognizer:pinchGesture];
    
    // rotationGesture
    
    UIRotationGestureRecognizer* rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                 action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    
    [self.view addGestureRecognizer:rotationGesture];
    
    // panGesture
    
    UIPanGestureRecognizer* panGesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    
    panGesture.delegate = self;
    
    [self.view addGestureRecognizer:panGesture];
    
    // verticalSwipeGesture
    
    UISwipeGestureRecognizer* verticalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleVerticalSwipe:)];
    
    verticalSwipeGesture.direction = UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp;
    verticalSwipeGesture.delegate = self;
    
    [self.view addGestureRecognizer:verticalSwipeGesture];
    
    // horizontalSwipeGesture
    
    UISwipeGestureRecognizer* horizontalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleHorizontalSwipe:)];
    
    horizontalSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    horizontalSwipeGesture.delegate = self;
    
    [self.view addGestureRecognizer:horizontalSwipeGesture];
}


#pragma mark - Methods

- (UIColor*) randomColor {
    
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

#pragma mark - Gestures

- (void) handleTap:(UITapGestureRecognizer*) tapGesture {
    
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    self.testView.backgroundColor = [self randomColor];
}

- (void) handleDoubleTap:(UITapGestureRecognizer*) tapGesture {
    
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 1.2f, 1.2f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    
    self.testViewScale = 1.2f;
}

- (void) handleDoubleTapDoubleTouch:(UITapGestureRecognizer*) tapGesture {
    
    NSLog(@"Double Tap Double Touch: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 0.8f, 0.8f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    
    self.testViewScale = 0.8f;
}

- (void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture {
    
    NSLog(@"handlePinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    CGFloat newScale = 1.f + pinchGesture.scale - self.testViewScale;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.testView.transform = newTransform;
    
    self.testViewScale = pinchGesture.scale;
}

- (void) handleRotation:(UIRotationGestureRecognizer*) rotationGesture {
    
    NSLog(@"handleRotation %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    
    self.testView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
}

- (void) handlePan:(UIPanGestureRecognizer*) panGesture {
    
    NSLog(@"handlePan");
    
    self.testView.center = [panGesture locationInView:self.view];
    
}

- (void) handleVerticalSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    
    NSLog(@"Vertical Swipe");
    
}

- (void) handleHorizontalSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    
    NSLog(@"Horizontal Swipe");
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
}

@end

