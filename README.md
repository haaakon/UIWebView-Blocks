UIWebView-Blocks
================

Adds blocks to all UIWebView delegate methods with a simple and easy to use category, no subclassing. Also allows the use of delegate methods if no block is set.

[![Build Status](https://travis-ci.org/haaakon/UIWebView-Blocks.png)](https://travis-ci.org/haaakon/UIWebView-Blocks)


## Usage

#### webViewDidStartLoading
```objective-c
[self.webView setWebViewDidStartLoadBlock:^(UIWebView *webView) {
    // your stuff here
}];
```

#### webViewDidFinishLoading
```objective-c
[self.webView setWebViewDidFinishLoadBlock:^(UIWebView *webView) {
   // your stuff here
}];
    
            
```

#### webView:shouldStartLoadWithRequest:navigationType:navigationType
```objective-c
[self.webView setWebViewShouldStartLoadWithRequestBlock:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
        // your stuff here
    return YES;
}];

```
#### webViewDidFailWithError:
```objective-c
[self.webView setWebViewDidFailWithErrorBlock:^(UIWebView *webView, NSError *error) {
    // your error handling code here
}];
```

### LICENSE

Copyright (C) 2013 Developed by Håkon Bogen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE
