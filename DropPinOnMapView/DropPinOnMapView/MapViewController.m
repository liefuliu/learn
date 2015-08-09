//
//  MapViewController.m
//  DropPinOnMapView
//
//  Created by Liefu Liu on 8/2/15.
//  Copyright (c) 2015 Liefu Liu. All rights reserved.
//

#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

#import "MapViewController.h"
#import "CCLocationManager.h"
#import "LFAnnotation.h"

@interface MapViewController () <CLLocationManagerDelegate> {
    CLLocationManager *locationmanager;
}
@end

@implementation MapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (IS_IOS8) {
        [UIApplication sharedApplication].idleTimerDisabled = TRUE;
        locationmanager = [[CLLocationManager alloc] init];
        [locationmanager requestAlwaysAuthorization];        //NSLocationAlwaysUsageDescription
        [locationmanager requestWhenInUseAuthorization];     //NSLocationWhenInUseDescription
        locationmanager.delegate = self;
    }
    
    [self performSelector:@selector(getLocation)];
    NSLog(@"viewDidLoad finished");
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"mapView didUpdateUserLocation");
    [self performSelector:@selector(getLocation)];
}


-(void)getLocation{
    NSLog(@"mapView getlocation");
    /*
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    
    NSLog(@"authorizationStatus: %@", authorizationStatus);
    
    //if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
    //    authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
    
    locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=1000.0f;
    
    [locationManager startUpdatingLocation];//启动位置更新
       [self.myMapView setShowsUserLocation:YES];
    */
    //}
    
    __block __weak MapViewController *wself = self;
    
    if (IS_IOS8) {
        [[CCLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            NSLog(@"%f %f",locationCorrrdinate.latitude,locationCorrrdinate.longitude);
            
            // Temporarily update the locaton to Zoom region
            MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(locationCorrrdinate, 2000, 2000);
            
            // Show me the location
            [self.myMapView setRegion:zoomRegion animated:YES];
            [self.myMapView setShowsUserLocation:YES];
            
            // Annotiataion
            // 1. create a coordinate for use with annotation
            CLLocationCoordinate2D wimbLocation;
            wimbLocation.latitude = locationCorrrdinate.latitude + 0.001f;
            wimbLocation.longitude = locationCorrrdinate.longitude + 0.001f;
            
            LFAnnotation *myAnnotation = [LFAnnotation alloc];
            
            myAnnotation.coordinate = wimbLocation;
            myAnnotation.title = @"New annotation title";
            myAnnotation.subtitle = @"New annotation sub title";
            
            [self.myMapView addAnnotation:myAnnotation];

            
        }];
    }

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    // TODO(liefuliu): Not sure how this is used.
    if (status == kCLAuthorizationStatusAuthorizedAlways ||
        status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"location manager granted");
    }
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
