//
//  ViewController.m
//  SK-Lesson-28 UITextField Part 2
//
//  Created by Dmitry Shapkin on 30/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange %@", NSStringFromRange(range));
//    NSLog(@"replacementString %@", string);
    
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([components count] > 1)
    {
        return NO;
    }
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
//    +XX (XXX) XXX-XXXX
    
    NSLog(@"new string = %@", newString);
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    
    newString = [validComponents componentsJoinedByString:@""];
    
//    XXXXXXXXXXXX
    
    NSLog(@"new string fixed = %@", newString);
    
    static const int localNumberMaxLength = 7;
    static const int areaCodeMaxLength = 3;
    static const int countryCodeMaxLength = 3;
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength)
    {
        return NO;
    }
    
    NSMutableString* resultString = [NSMutableString string];
    
//    XXXXXXXXXXXX
//    +XX (XXX) XXX-XXXX
    
    NSInteger localNumberLength = MIN([newString length], localNumberMaxLength);
    
    if (localNumberLength > 0)
    {
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
        
        [resultString appendString:number];
        
        if ([resultString length] > 3)
        {
            [resultString insertString:@"-" atIndex:3];
        }
        
    }
    
    if ([newString length] > localNumberMaxLength)
    {
        NSInteger areaCodeLength = MIN((int)[newString length] - localNumberMaxLength, areaCodeMaxLength);
        
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
        
        NSString* area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        
        [resultString insertString:area atIndex:0];
    }
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength)
    {
        NSInteger countryCodeLength = MIN((int)[newString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        
        [resultString insertString:countryCode atIndex:0];
    }
    
    
    textField.text = resultString;
    
    return NO;

//    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@" ,?"];
//
//    NSCharacterSet* set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
//    NSArray* words = [resultString componentsSeparatedByCharactersInSet:set];
//    NSLog(@"words = %@", words);
//     
//    return [resultString length] <= 10;
    
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
