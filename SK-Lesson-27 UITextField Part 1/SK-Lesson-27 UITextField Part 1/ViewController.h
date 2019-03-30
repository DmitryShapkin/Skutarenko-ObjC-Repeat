//
//  ViewController.h
//  SK-Lesson-27 UITextField Part 1
//
//  Created by Dmitry Shapkin on 30/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* firstNameField;
@property (weak, nonatomic) IBOutlet UITextField* lastNameField;

- (IBAction)actionLog:(id)sender;
- (IBAction)actionTextChanged:(UITextField *)sender;

@end
