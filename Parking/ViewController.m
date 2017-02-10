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
#import "Tab2ViewController.h"



@interface ViewController ()
{

  
}


@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;


@property (weak, nonatomic) IBOutlet UIView *mrootview;

@property(nonatomic,strong)Tab2ViewTool *tab2ViewTool;

@property(nonatomic,strong)Tab1ViewTool *tab1ViewTool;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   
    
    self.tab2ViewTool =[[Tab2ViewTool alloc]init];
    self.tab1ViewTool =[[Tab1ViewTool alloc]init];
    

  
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentValueChanged:(id)sender {
    NSInteger index= [sender selectedSegmentIndex];
   
    
    if(index==1){
        
//         tab2View *tabview=[[tab2View alloc]init] ;
        
        [self.tab2ViewTool initView:self.mrootview];
        
        
    }else{
        
         [self.tab1ViewTool initView:self.mrootview];
        
        UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];

        
        NSLog(@"ashdkuashdkjhasjk%@",rootViewController.navigationController);
        [self.tab1ViewTool setMNavigationController:rootViewController.navigationController];
        
        
    }
   
    
    
}



    

@end
