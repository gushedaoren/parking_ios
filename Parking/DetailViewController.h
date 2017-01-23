//
//  DetailViewController.h
//  Parking
//
//  Created by oliver on 22/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "BaseViewController.h"

@interface DetailViewController : BaseViewController

@property (nonatomic, copy) NSArray *data;

@property (weak, nonatomic) IBOutlet UILabel *label0;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;


@end
