//
//  ViewController.m
//  RightNavView_Demo
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "RightNavSelectView.h"
@interface ViewController ()
@property(strong,nonatomic)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(0, 0, 40, 30);
    self.btn.titleLabel.font =[UIFont systemFontOfSize:12];
    [self.btn setTitle:@"全部" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor redColor]];
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.btn];
    
}
-(void)btnAction
{

    
    RightNavSelectView *carView= [[RightNavSelectView alloc] initWithFrame:self.view.bounds listArr:@[@"全部",@"发车",@"发货"]];
    [carView show];
    
    
    __weak ViewController *weakSelf = self;
    
    carView.block = ^(NSString *navStr){
        [weakSelf.btn setTitle:navStr forState:UIControlStateNormal];
    };
}

@end
