//
//  ViewController.m
//  SK-Lesson-36 UIPopoverController
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"
#import "DSDetailsViewController.h"


@interface ViewController () <UIPopoverControllerDelegate>

//@property (strong, nonatomic) UIPopoverController* popover;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem*)sender
{
    DSDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DSDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        NSLog(@"iPad");
        //[self showController:vc inPopoverFromSender:sender];
    }
    else
    {
        [self showControllerAsModal:vc];
    }
}

- (IBAction)actionPressMe:(UIButton*)sender {
    
    DSDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DSDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        NSLog(@"iPad");
        //[self showController:vc inPopoverFromSender:sender];
    }
    else
    {
        [self showControllerAsModal:vc];
    }
}

- (void)showControllerAsModal:(UIViewController*)vc
{
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav
                       animated:YES
                     completion:^{
                         double delayInSeconds = 3.0;
                         dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                         dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                             
                             [self dismissViewControllerAnimated:YES completion:nil];
                         });
                     }];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue %@ %@", segue.identifier, NSStringFromClass([segue.destinationViewController class]));
    
    UINavigationController* nav = segue.destinationViewController;
    DSDetailsViewController* vc = [nav.viewControllers firstObject];
    
    vc.bgColor = [UIColor blueColor];
}

@end
