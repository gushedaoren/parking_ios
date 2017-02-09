//
//  Tab2ViewSetting.m
//  Parking
//
//  Created by oliver on 09/02/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "Tab2ViewTool.h"

@implementation Tab2ViewTool

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)initView :(UIView *)rootView{
    UIView *subView =[[UIView alloc]init];
    
    subView.frame=CGRectMake(0, 0, rootView.bounds.size.width, rootView.bounds.size.height);
    subView.backgroundColor=[UIColor redColor];
    
    [rootView addSubview:subView];
    
    
    
}

@end
