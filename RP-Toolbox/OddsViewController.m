//
//  OddsViewController.m
//  RP-Toolbox
//
//  Created by matthew ingwersen on 1/30/17.
//  Copyright © 2017 Resolution Technologies. All rights reserved.
//

#import "OddsViewController.h"

@interface OddsViewController ()

@end

@implementation OddsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"EotERoller" withExtension:@"htm"];
    
    NSString *theAbsoluteURLString = [url absoluteString];
    
    NSString *queryString = @"?montecarlo=100000#";
    
    NSString *absoluteURLwithQueryString = [theAbsoluteURLString stringByAppendingString: queryString];
    
    NSURL *finalURL = [NSURL URLWithString: absoluteURLwithQueryString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:finalURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:(NSTimeInterval)10.0 ];
    
    [_oddsWebView loadRequest:request];

   /* NSURL *url = [[NSBundle mainBundle] URLForResource:@"EotERoller" withExtension:@"htm"];
    NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    [_oddsWebView loadHTMLString:html baseURL:baseUrl];
    */
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

@end
