//
//  DetailViewController.m
//  Parking
//
//  Created by oliver on 22/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
//@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.data);
    
//    self.label0.text=self.data[0];
//    self.label1.text=self.data[1];
//    self.label2.text=self.data[2];
//    self.label3.text=self.data[3];
//    self.label4.text=self.data[4];
//    self.label5.text=self.data[5];
    
     [self setLabelData:self.label0 :0];
     [self setLabelData:self.label1 :1];
     [self setLabelData:self.label2 :2];
     [self setLabelData:self.label3 :3];
     [self setLabelData:self.label4 :4];
     [self setLabelData:self.label5 :5];
    
  
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


-(void)setLabelData :(UILabel*) mLabel :(long) pos{
    @try {
        mLabel.text=[NSString stringWithFormat:@"%@",self.data[pos]];

    } @catch (NSException *exception) {
        
        mLabel.text=@"0";
        
    } @finally {
        
    }
    
    
}

@end
