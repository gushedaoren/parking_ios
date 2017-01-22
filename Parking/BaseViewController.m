//
//  BaseViewController.m
//  Parking
//
//  Created by oliver on 22/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
//        CGRect frame=self.view.frame;
//        if (frame.size.height==[[NSUserDefaults standardUserDefaults] floatForKey:@"windowHeight"])
//        {
//            frame.size.height-=20;
//        }
//        self.view.frame=frame;
//    }
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
