//
//  ViewController.m
//  SK-Lesson-27 UITextField Part 1
//
//  Created by Dmitry Shapkin on 30/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController () <UITextFieldDelegate>

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    
    [self.firstNameField becomeFirstResponder];
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

- (IBAction)actionLog:(id)sender
{
    NSLog(@"First Name = %@, Last Name = %@", self.firstNameField.text, self.lastNameField.text);
    
    if ([self.firstNameField isFirstResponder])
    {
        [self.firstNameField resignFirstResponder];
    }
    else if ([self.lastNameField isFirstResponder])
    {
        [self.lastNameField resignFirstResponder];
    }
}

- (IBAction)actionTextChanged:(UITextField *)sender
{
    NSLog(@"%@", sender.text);
}

#pragma mark - UITextFieldDelegate

// - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
// {
//     return [textField isEqual:self.firstNameField];
// }
//
// - (BOOL)textFieldShouldClear:(UITextField *)textField
// {
//     return NO;
// }

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.firstNameField])
    {
        [self.lastNameField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - Notifications

- (void) notificationTextDidBeginEditing
{
    NSLog(@"notificationTextDidBeginEditing");
}

- (void) notificationTextDidEndEditing:(NSNotification*) notification
{
    NSLog(@"notificationTextDidEndEditing");
}

- (void) notificationTextDidChangeEditing:(NSNotification*) notification
{
    NSLog(@"notificationTextDidChangeEditing");
}

@end
