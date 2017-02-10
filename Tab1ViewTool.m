//
//  Tab1ViewTool.m
//  Parking
//
//  Created by oliver on 09/02/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "Tab1ViewTool.h"


@interface Tab1ViewTool ()
{
    UITableView *mtableView;
    NSArray* resultArray;
    UIViewController *superVC;
    
}


@end

@implementation Tab1ViewTool
@synthesize mNavigationController;



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
    subView.backgroundColor=[UIColor greenColor];
    
    mtableView=[[UITableView alloc]init];
    
    mtableView.frame=CGRectMake(0, 0, rootView.bounds.size.width, rootView.bounds.size.height);
    
    [subView addSubview:mtableView];
    
    [rootView addSubview:subView];
    
    
    mtableView.dataSource=self;
    mtableView.delegate=self;
    
    
    [self obtainData];
    
    
    
}

-(void)obtainData
{
    // 启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *URLString = @"http://10.10.3.59:3000";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:NULL progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"JSON: %@", responseObject);
        //        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //接下来一步一步解析。知道得到你想要的东西。
        NSDictionary* arrayDic =[responseObject objectAtIndex:0];
        resultArray = [arrayDic objectForKey:@"data"];
        
        
        
        
        
        NSLog(@"Data: %@", resultArray[0][0]);
        
        [mtableView reloadData];
        
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"JSON: %@", error);
        
    }];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return resultArray.count-1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    
//    UITableViewCell *cell=[[UITableViewCell alloc]init];
    
    
//    
//    
//    static NSString *CustomCellIdentifier = @"mTableCell";
//    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier forIndexPath:indexPath];
//    
//    UILabel *address=(UILabel *)[cell.contentView viewWithTag:1];
//    
//    
//    
//    @try {
//        //        cell.textLabel.text=resultArray[indexPath.row+1][5];
//        
//        
//        address.text=resultArray[indexPath.row+1][5];
//        
//        
//        
//        
//        
//        return  cell;
//    }
//    @catch (NSException *exception) {
//        address.text=@"null";
//        return  cell;
//    }
//    @finally {
//        // 结果处理
//        return cell;
//    }
    
    
    static NSString *CMainCell = @"CMainCell";     //  0
    
    ParkingListCell *cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];      //   1
    if (cell == nil) {
        cell = [[ParkingListCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: CMainCell];    //  2
        
        [cell initCell];
       
    }
    
    
    cell.label1.text=resultArray[indexPath.row+1][5];;
    
    
       
    return cell;
    
    
}



- (UIViewController *)viewController:(UIView *)view{
    
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *pageDetial=[[DetailViewController alloc]init];

//    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
//    NSLog(@"%@",rootViewController.navigationController);
    
    
    superVC = [self viewController:self];
    
    [superVC.navigationController pushViewController:pageDetial animated:YES];
    
   
    
}


@end
