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

- (void)setWebViewShouldStartLoadWithRequestBlock:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))webViewShouldStartLoadWithRequestBlock;
- (void)setWebViewDidStartLoadBlock:(void (^)(UIWebView *webView))webViewDidStartLoadBlock;
- (void)setWebViewDidFinishLoadBlock:(void (^)(UIWebView *webView))webViewDidFinishLoadBlock;
- (void)setWebViewDidFailWithErrorBlock:(void (^)(UIWebView *webView, NSError *error))webViewDidFailWithErrorBlock;

@end
