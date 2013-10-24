//
//  UIWebView+Blocks.m
//  UIWebView-Blocks Example
//
//  Created by Håkon Bogen on 21.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "UIWebView+Blocks.h"
#import <objc/runtime.h>

typedef BOOL (^UIWebViewRequestAndNavigationTypeBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);
typedef void (^UIWebViewVoidBlock)(UIWebView *webView);
typedef void (^UIWebViewVoidErrorBlock)(UIWebView *webView,NSError *error);

static const void *UIWebViewDelegateKey                           = &UIWebViewDelegateKey;
static const void *UIWebViewShouldStartLoadWithRequestKey                           = &UIWebViewShouldStartLoadWithRequestKey;
static const void *UIWebViewDidStartLoadKey                           = &UIWebViewDidStartLoadKey;
static const void *UIWebViewDidFinishLoadKey                           = &UIWebViewDidFinishLoadKey;
static const void *UIWebViewDidFailWithErrorKey                           = &UIWebViewDidFailWithErrorKey;

@implementation UIWebView (Blocks)

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    UIWebViewRequestAndNavigationTypeBlock block = webView.webViewShouldStartLoadWithRequestBlock;
    if (block) {
        return block(webView,request,navigationType);
    }
    
    id delegate = objc_getAssociatedObject(self, UIWebViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        return [delegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    // return default value just in case
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    UIWebViewVoidBlock block = webView.webViewDidStartLoadBlock;
    if (block) {
        block(webView);
    }
    
    id delegate = objc_getAssociatedObject(self, UIWebViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [delegate webViewDidStartLoad:webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    UIWebViewVoidBlock block = webView.webViewDidFinishLoadBlock;
    if (block) {
        block(webView);
    }
    
    id delegate = objc_getAssociatedObject(self, UIWebViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [delegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIWebViewVoidErrorBlock block = webView.webViewDidFailWithErrorBlock;
    if (block) {
        block(webView, error);
    }
    
    id delegate = objc_getAssociatedObject(self, UIWebViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [delegate webView:webView didFailLoadWithError:error];
    }
}

- (BOOL (^)(UIWebView *, NSURLRequest *, UIWebViewNavigationType))webViewShouldStartLoadWithRequestBlock
{
    return objc_getAssociatedObject(self, UIWebViewShouldStartLoadWithRequestKey);
}

- (void)setWebViewShouldStartLoadWithRequestBlock:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))webViewShouldStartLoadWithRequestBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UIWebViewShouldStartLoadWithRequestKey, webViewShouldStartLoadWithRequestBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIWebView *))webViewDidStartLoadBlock
{
    return objc_getAssociatedObject(self, UIWebViewDidStartLoadKey);
}

- (void)setWebViewDidStartLoadBlock:(void (^)(UIWebView *))webViewDidStartLoadBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UIWebViewDidStartLoadKey, webViewDidStartLoadBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIWebView *))webViewDidFinishLoadBlock
{
    return objc_getAssociatedObject(self, UIWebViewDidFinishLoadKey);
}

- (void)setWebViewDidFinishLoadBlock:(void (^)(UIWebView *webView))webViewDidFinishLoadBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UIWebViewDidFinishLoadKey, webViewDidFinishLoadBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)(UIWebView *, NSError *))webViewDidFailWithErrorBlock
{
    return objc_getAssociatedObject(self, UIWebViewDidFailWithErrorKey);
}

- (void)setWebViewDidFailWithErrorBlock:(void (^)(UIWebView *, NSError *))webViewDidFailWithErrorBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UIWebViewDidFailWithErrorKey, webViewDidFailWithErrorBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UIWebViewDelegate>)self) {
        objc_setAssociatedObject(self, UIWebViewDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIWebViewDelegate>)self;
    }
}

@end
