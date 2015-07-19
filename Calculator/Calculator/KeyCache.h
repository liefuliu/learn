//
//  KeyCache.h
//  Calculator
//
//  Created by Liefu Liu on 7/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyCache : NSObject

@property (nonatomic, strong, readonly) NSString* displayText;
@property (strong, readonly) NSMutableArray* inputArray;


- (void) pressKey:(char) key;
- (void) clear;
- (instancetype) init;



@end
