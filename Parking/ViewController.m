//
//  ViewController.m
//  Parking
//
//  Created by oliver on 12/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"//主要用于网络请求方法


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self obtainData];
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)obtainData
{
    // 启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *URLString = @"http://10.10.2.44:3000";

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:NULL progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //接下来一步一步解析。知道得到你想要的东西。
        NSDictionary* arrayDic =[responseObject objectAtIndex:0];
        NSArray* resultArray = [arrayDic objectForKey:@"data"];
        
    
        
        NSArray* resultData = [NSString stringWithFormat:@"%@",[resultArray objectAtIndex:0]];
        
        NSLog(@"Data: %@", [responseObject[0] objectForKey:@"data"] [0][0]);
        
        
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"JSON: %@", error);

    }];
    
    
}


@end