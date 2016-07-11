//
//  RightNavSelectView.h
//  RightNavView_Demo
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RightNavViewBlock)(NSString *navStr);


@interface RightNavSelectView : UIView

-(instancetype)initWithFrame:(CGRect)frame listArr:(NSArray *)listArr;
-(void)show;
@property(copy,nonatomic)RightNavViewBlock block;
@end
