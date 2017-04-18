//
//  HD_WebViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/16.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_WebViewController.h"

@interface HD_WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation HD_WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)back:(id)sender {
    
    [self.webView goBack];
    
}

- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

- (IBAction)reload:(id)sender {
    [self.webView reload];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.backItem.enabled = webView.canGoBack;
    self.backItem.enabled = webView.canGoForward;
}

@end
