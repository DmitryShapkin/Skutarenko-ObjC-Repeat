//
//  ViewController.h
//  SK-Lesson-39 UIWebView
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


@import UIKit;


@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView* webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* indicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* forwardButtonItem;

- (IBAction) actionBack:(id)sender;
- (IBAction) actionForward:(id)sender;
- (IBAction) actionRefresh:(id)sender;

@end
