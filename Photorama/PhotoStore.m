//
//  PhotoStore.m
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PhotoStore.h"
#import "FlickrAPI.h"
#import "Photo.h"

@interface PhotoStore ()
@property (strong, nonatomic) NSURLSession* session;
@end

@implementation PhotoStore

- (instancetype) init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config =
        [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}

- (void) fetchRecentPhotosWithCompletion:(void(^)(NSArray*)) completetion {
    NSLog(@"fetchRecentPhotos began");
    
    NSURL *url = [FlickrAPI recentPhotosURL];
    NSLog(@"url: %@",url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"completionHandler block began");
        NSArray *photos = nil;
        if (data != nil) {
            photos = [FlickrAPI photosFromJSONData:data];
            NSLog(@"photos:%@", photos);
        } else {
            NSLog(@"Failed to fetch data. Error: %@", error.localizedDescription);
        }
        
        if (completetion) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completetion(photos);
            }];
        }
    }];
    [task resume];
}


- (void) fetchImageForPhoto:(Photo*)photo completion:(void(^)(UIImage*)) completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:photo.URL];
    
    NSURLSessionDownloadTask *task =
    [self.session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSLog(@"fetchImageForPhoto. URL:%@", location);
        UIImage *image = nil;
        if (location != nil) {
            NSData * imageData = [NSData dataWithContentsOfURL: location];
            image = [UIImage imageWithData: imageData];
            photo.image = image;
        } else {
            NSLog(@"Failed to download image at :%@: %@",
                  photo.URL, error.localizedDescription);
        }
        
        if (completion) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completion(image);
            }];
        }
        
    }];
    [task resume];
}

@end
