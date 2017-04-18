//
//  HD_LoginRegistViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/14.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_LoginRegistViewController.h"

@interface HD_LoginRegistViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegister;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation HD_LoginRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loginRegister.layer.cornerRadius = 5;
    self.loginRegister.layer.masksToBounds = YES;
    
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showLoginOrRegister:(UIButton *)sender {
    
    
    [self.view endEditing:YES];
    if (self.leftMargin.constant) { //目前显示的是注册界面
        self.leftMargin.constant = 0;
        
        [sender setTitle:@"注册界面" forState:UIControlStateNormal];
        
    }else{
        self.leftMargin.constant = - self.view.HD_width;
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}



- (IBAction)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
