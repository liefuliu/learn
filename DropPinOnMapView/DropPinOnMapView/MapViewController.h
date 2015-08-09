//
//  MapViewController.h
//  DropPinOnMapView
//
//  Created by Liefu Liu on 8/2/15.
//  Copyright (c) 2015 Liefu Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate,MKAnnotation> {
  CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;



@end
