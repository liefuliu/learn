//
//  ViewController.h
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoStore;

@interface PhotosViewController : UIViewController

@property (strong, nonatomic) PhotoStore *photoStore;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

