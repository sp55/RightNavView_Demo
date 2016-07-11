//
//  RightNavSelectView.m
//  RightNavView_Demo
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "RightNavSelectView.h"


@interface RightNavSelectView ()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *right_nav_Img;
@property(strong,nonatomic)UIView *navView;
@property(strong,nonatomic)NSArray *titlesArr;
@end
@implementation RightNavSelectView
-(instancetype)initWithFrame:(CGRect)frame listArr:(NSArray *)listArr
{
    if (self=[super initWithFrame:frame]) {
        
        self.titlesArr = [listArr copy];
        
        [self initUI];
    }
    return self;
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}

-(void)dismiss{
    [self removeFromSuperview];
    
}


-(void)initUI
{
    
    
    self.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    
    self.backgroundColor = [UIColor clearColor];
    
    CGFloat kWidth =[UIScreen mainScreen].bounds.size.width;
    CGFloat kHeight =[UIScreen mainScreen].bounds.size.height;
    
    _bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _bgView.backgroundColor =[UIColor clearColor];
    [self addSubview:_bgView];
    
    

    _right_nav_Img  =[[UIImageView alloc]initWithFrame:CGRectMake(kWidth-90, 64, 80, 11+41*(self.titlesArr.count))];
    _right_nav_Img.image =[UIImage imageNamed:@"right_nav_Img"];
    _right_nav_Img.userInteractionEnabled = YES;
    [_bgView addSubview:_right_nav_Img];
    
    
    _navView =[[UIView alloc]initWithFrame:CGRectMake(1, 10, 78, 41*(self.titlesArr.count))];
    _navView.backgroundColor =[UIColor lightGrayColor];
    [_right_nav_Img addSubview:_navView];
    
    
    
    for (NSInteger i=0; i<self.titlesArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 41*i, 78, 40);
        [btn setTitle:self.titlesArr[i] forState:UIControlStateNormal];
        btn.tag = 100+i;
        btn.titleLabel.font =[UIFont systemFontOfSize:12];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [_navView addSubview:btn];
    }
    
    
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    
}
-(void)btnAction:(UIButton *)btn
{
    [self dismiss];
    
    _block(btn.titleLabel.text);
}


@end
