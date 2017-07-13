//
//  ViewController.m
//  ELeMeOrderPage
//
//  Created by liyifang on 2017/7/13.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ViewController.h"
#import "ELeMeOrderPageViewMainController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickButton:(id)sender {
    ELeMeOrderPageViewMainController *rootVC = [[ELeMeOrderPageViewMainController alloc]init];
    UINavigationController *NAVC = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [self presentViewController:NAVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
