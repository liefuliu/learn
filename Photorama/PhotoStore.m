//
//  PhotoStore.m
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PhotoStore.h"
#import "FlickrAPI.h"

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

- (void) fetchRecentPhotos {
    NSLog(@"fetchRecentPhotos began");
    
    NSURL *url = [FlickrAPI recentPhotosURL];
    NSLog(@"url: %@",url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"completionHandler block began");
        if (data != nil) {
            NSLog(@"Successfully fetch the data. Parsing the data now...");
            NSLog(@"data:%@",data);
            NSString* jsonString =
            [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Json string: %@", jsonString);
        } else {
            NSLog(@"Failed to fetch data. Error: %@", error.localizedDescription);
        }
    }];
    [task resume];
}

@end
