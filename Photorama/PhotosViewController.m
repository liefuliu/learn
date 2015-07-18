//
//  ViewController.m
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotoStore.h"

@interface PhotosViewController ()

@end

@implementation PhotosViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.photoStore fetchRecentPhotosWithCompletion:^(NSArray *photos) {
        NSLog(@"Found %lu photos", (unsigned long) photos.count);
        
        [self.photoStore fetchImageForPhoto:photos.firstObject completion:^(UIImage* image) {
            self.imageView.image = image;
        }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
