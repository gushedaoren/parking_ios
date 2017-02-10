//
//  Tab1ViewTool.h
//  Parking
//
//  Created by oliver on 09/02/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"//主要用于网络请求方法
#import "DetailViewController.h"
#import "ParkingListCell.h"
@interface Tab1ViewTool : UIView <UITableViewDataSource,UITableViewDelegate>
-(void)initView :(UIView *)rootView;
@property (nonatomic,weak) UINavigationController *mNavigationController;
@end


