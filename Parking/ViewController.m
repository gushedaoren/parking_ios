//
//  ViewController.m
//  Parking
//
//  Created by oliver on 12/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"//主要用于网络请求方法
#import "DetailViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mtableView;


@end

@implementation ViewController
NSArray* resultArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mtableView.dataSource=self;
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
        resultArray = [arrayDic objectForKey:@"data"];
        
    
        
       
        
        NSLog(@"Data: %@", resultArray[0][0]);
        
        [self.mtableView reloadData];
        
        
        
        
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"JSON: %@", error);

    }];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return resultArray.count-1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    static NSString *CustomCellIdentifier = @"mTableCell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier forIndexPath:indexPath];

    UILabel *address=(UILabel *)[cell.contentView viewWithTag:1];
    

    
    @try {
//        cell.textLabel.text=resultArray[indexPath.row+1][5];
        
        
        address.text=resultArray[indexPath.row+1][5];
        
        
        

        
        return  cell;
    }
    @catch (NSException *exception) {
        address.text=@"null";
        return  cell;
           }
    @finally {
        // 结果处理
        return cell;
    }
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"toDetail"])
    {         DetailViewController *page2=segue.destinationViewController;
        
        
             NSIndexPath *indexPath=self.mtableView.indexPathForSelectedRow;
        
//            NSLog(@"%@",resultArray[indexPath.row+1]);
        
             page2.data=resultArray[indexPath.row+1] ;
        
        
        
    }
    
}

@end
