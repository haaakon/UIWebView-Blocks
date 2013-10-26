//
//  HBViewController.m
//  UIWebView-Blocks Example
//
//  Created by Håkon Bogen on 21.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "AAAViewController.h"
#import "UIWebView+Blocks.h"

@interface AAAViewController ()

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://haaakon.github.io"]]];
    
    [self.webView setWebViewDidFinishLoadBlock:^(UIWebView *webView) {
        NSLog(@"%s",__PRETTY_FUNCTION__);
    }];
    
    [self.webView setWebViewDidStartLoadBlock:^(UIWebView *webView) {
        NSLog(@"%s",__PRETTY_FUNCTION__);
    }];
    
    [self.webView setWebViewShouldStartLoadWithRequestBlock:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
        NSLog(@"%s",__PRETTY_FUNCTION__);
        return YES;
    }];
    
    [self.webView setWebViewDidFailWithErrorBlock:^(UIWebView *webView, NSError *error) {
        // your error handling code here
    }];
}


@end
