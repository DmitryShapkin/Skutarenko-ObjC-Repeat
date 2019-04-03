//
//  ViewController.m
//  SK-Lesson-39 UIWebView
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     NSString* urlString = @"http://vk.com/iosdevcourse";
     
     NSURL* url = [NSURL URLWithString:urlString];
     
     NSURLRequest* request = [NSURLRequest requestWithURL:url];
     
     [self.webView loadRequest:request];
     
     */
    
    //NSString* filePath = [[NSBundle mainBundle] pathForResource:@"1.pdf" ofType:nil];
    
    /*
     
     NSData* fileData = [NSData dataWithContentsOfFile:filePath];
     
     [self.webView loadData:fileData
     MIMEType:@"application/pdf"
     textEncodingName:@"UTF-8"
     baseURL:nil];
     
     */
    
    /*
     NSURL* fileUrl = [NSURL fileURLWithPath:filePath];
     
     NSURLRequest* request = [NSURLRequest requestWithURL:fileUrl];
     
     [self.webView loadRequest:request];
     */
    
    NSString* htmlString = @"<html>"
    "<body>"
    "<p style=\"font-size: 500%%; text-align: center;\">Hello World!</p>"
    "<a href=\"http://vk.com/iosdevcourse\"><b>iOS Dev Course</b></a>"
    "<a href=\"cmd:show_alert\">TEST BUTTON</a>"
    "</body>"
    "</html>";
    
    
    [self.webView loadHTMLString:htmlString baseURL:nil];
}


#pragma mark - Actions

- (IBAction) actionBack:(id)sender
{
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction) actionForward:(id)sender
{
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction) actionRefresh:(id)sender
{
    [self.webView stopLoading];
    [self.webView reload];
}

- (void) refreshButtons
{
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
    
    NSString* urlString = [request.URL absoluteString];
    
    if ([urlString hasPrefix:@"cmd:"]) {
        
        NSString* command = [urlString substringFromIndex:4];
        
        if ([command isEqualToString:@"show_alert"]) {
            
            [[[UIAlertView alloc] initWithTitle:@"HELLO WORLD"
                                        message:@"Hi there!"
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
    
    [self.indicator startAnimating];
    
    //[[UIApplication sharedApplication] s];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError %@", [error localizedDescription]);
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
}

@end
