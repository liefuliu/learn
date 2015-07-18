//
//  PhotoStore.h
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//
#import <UIKit/UIKit.h>

@class Photo;

@interface PhotoStore : NSObject

- (void) fetchRecentPhotosWithCompletion:(void(^)(NSArray*)) completetion ;
- (void) fetchImageForPhoto:(Photo*)photo completion:(void(^)(UIImage*)) completion;

@end
