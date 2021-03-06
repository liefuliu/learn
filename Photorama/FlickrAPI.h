//
//  FlickrAPI.h
//  Photorama
//
//  Created by liefuliu on 7/16/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrAPI : NSObject

+ (NSURL*) recentPhotosURL;
+ (NSArray*) photosFromJSONData:(NSData*) data;

@end
