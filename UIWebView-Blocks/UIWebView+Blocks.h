//
//  UIWebView+Blocks.h
//  UIWebView-Blocks Example
//
//  Created by Håkon Bogen on 21.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Blocks)

@property (copy, nonatomic) BOOL (^webViewShouldStartLoadWithRequestBlock)(UIWebView *webView, NSURLRequest *request,UIWebViewNavigationType navigationType);
@property (copy, nonatomic) void (^webViewDidStartLoadBlock)(UIWebView *webView);
@property (copy, nonatomic) void (^webViewDidFinishLoadBlock)(UIWebView *webView);
@property (copy, nonatomic) void (^webViewDidFailWithErrorBlock)(UIWebView *webView,NSError *error);

- (void)setWebViewDidFinishLoadBlock:(void (^)(UIWebView *webView))webViewDidFinishLoadBlock;
@end
