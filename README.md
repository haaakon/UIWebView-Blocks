UIWebView-Blocks
================


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

```objective-c
[self.webView setWebViewShouldStartLoadWithRequestBlock:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
        // your stuff here
    return YES;
}];

        
```
