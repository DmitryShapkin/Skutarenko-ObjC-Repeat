//
//  DSSettingsViewController.m
//  SK-Lesson-29 UITableView Static Cells
//
//  Created by Dmitry Shapkin on 31/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "DSSettingsViewController.h"


@interface DSSettingsViewController ()

@end

static NSString* kSettingsLogin           = @"login";
static NSString* kSettingsPassword        = @"password";
static NSString* kSettingsLevel           = @"level";
static NSString* kSettingsShadows         = @"shadows";
static NSString* kSettingsDetalization    = @"detalization";
static NSString* kSettingsSound           = @"sound";
static NSString* kSettingsMusic           = @"music";


@implementation DSSettingsViewController

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadSettings];
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - Notifications

- (void) notificationKeyboardWillShow:(NSNotification*) notification
{
    NSLog(@"notificationKeyboardWillShow:\n%@", notification.userInfo);
}

- (void) notificationKeyboardWillHide:(NSNotification*) notification
{
    NSLog(@"notificationKeyboardWillHide:\n%@", notification.userInfo);
}


#pragma mark - Save and Load

- (void)saveSettings
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userDefaults setDouble:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    [userDefaults synchronize];
}

- (void)loadSettings
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults objectForKey:kSettingsPassword];
    self.levelControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsLevel];
    self.shadowsSwitch.on = [userDefaults boolForKey:kSettingsShadows];
    self.detalizationControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsDetalization];
    self.soundSlider.value = [userDefaults doubleForKey:kSettingsSound];
    self.musicSlider.value = [userDefaults doubleForKey:kSettingsMusic];
}


#pragma mark - Actions

- (IBAction)actionTextChanged:(UITextField *)sender
{
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender
{
    [self saveSettings];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.loginField])
    {
        [self.passwordField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    return NO;
}

@end
