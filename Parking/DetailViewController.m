//
//  DetailViewController.m
//  Parking
//
//  Created by oliver on 22/01/2017.
//  Copyright © 2017 oliver. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()
{
    CLGeocoder *_geocoder;
    BMKMapView* mapView ;


}
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
     [self showMap:self.data[5]];
    
//    [self addPin:31.305399000000001 :121.488561];
    
  
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



-(void)showMap :(NSString*) address{
    mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 360, 480)];

    mapView.delegate=self;
    mapView.showsUserLocation=YES;

    
    
    _geocoder=[[CLGeocoder alloc]init];
    [self getCoordinateByAddress:address];
    
    [self.mapRootView addSubview:mapView];

    
    
}

-(void)setLabelData :(UILabel*) mLabel :(long) pos{
    @try {
        mLabel.text=[NSString stringWithFormat:@"%@",self.data[pos]];

    } @catch (NSException *exception) {
        
        mLabel.text=@"0";
        
    } @finally {
        
    }
    
    
}




#pragma mark 根据地名确定地理坐标
-(void)getCoordinateByAddress:(NSString *)address{
    
    
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
         CLPlacemark *placemark=[placemarks firstObject];
        
        for(NSInteger i=0;i<placemarks.count;i++){
            NSString *city=[placemark.addressDictionary valueForKey:@"City"] ;
            NSLog(@"city %@",city);
            if(![city isEqualToString:@"上海市"]) {
                placemark=placemarks[i];
            }else{
                break;
            }
        }
        
        NSString *name=[placemark.addressDictionary valueForKey:@"Name"] ;
        NSLog(@"address %@",name);
        
        CLLocation *location=placemark.location;//位置

        NSLog(@"%@",placemark.addressDictionary);
        
        double latitude=location.coordinate.latitude;
        double longitude=location.coordinate.longitude;
     
        
        [self addPin: latitude:longitude];
      
       
        
        
    }];
}


#pragma clang diagnostic ignored "-Wmissing-selector-name"
-(void)addPin:(double) mlatitude:(double) mlongitude{
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude =mlatitude;
    coor.longitude = mlongitude;
    annotation.coordinate = coor;
    annotation.title = @"导航去这里";
    
    
    [mapView addAnnotation:annotation];
    [mapView setCenterCoordinate:coor];

}

//// Override
//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
//        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
//        return newAnnotationView;
//    }
//    return nil;
//}
@end
