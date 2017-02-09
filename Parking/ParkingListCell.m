//
//  ParkingListCell.m
//  Parking
//
//  Created by oliver on 09/02/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "ParkingListCell.h"



@implementation ParkingListCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)initCell{

    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 200, 50)];
    self.label1.textAlignment = NSTextAlignmentLeft;
    self.label1.textColor = [UIColor blackColor];
    self.label1.font = [UIFont boldSystemFontOfSize:16.0];
    self.label1.backgroundColor = [UIColor clearColor];
    self.label1.numberOfLines = 2;
    [self.contentView addSubview:self.label1];

}

@end
