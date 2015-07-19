//
//  KeyCacheTest.m
//  Calculator
//
//  Created by Liefu Liu on 7/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KeyCache.h"

@interface KeyCacheTest : XCTestCase


@end


@implementation KeyCacheTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) addKeys:(NSString*) keys
toCache:(KeyCache*) cache {
    for(int i=0;i<keys.length;i++) {
        [cache pressKey:[keys characterAtIndex:i]];
    }
}

- (void) expectInputArray:(NSString*)inputKeys
                matchWith:(NSArray*) array {
    KeyCache* cache = [[KeyCache alloc] init];
    [self addKeys:inputKeys toCache:cache];
    XCTAssert([cache.inputArray isEqualToArray:array]);
}


- (void) testKeyWithBrackets {
    KeyCache* cache = [[KeyCache alloc] init];
    [self addKeys:@"(8+9)" toCache:cache];
    NSArray* expectedArray = @[@"(", @"8", @"+", @"9", @")"];
    XCTAssert([cache.inputArray isEqualToArray:expectedArray]);
    
    cache = [[KeyCache alloc] init];
    [self addKeys:@"(8+9))" toCache:cache];
    
    // The second ')' is not a valid key and thus will be ignored.
    expectedArray = @[@"(", @"8", @"+", @"9", @")"];
    XCTAssert([cache.inputArray isEqualToArray:expectedArray]);
    
    
    cache = [[KeyCache alloc] init];
    [self addKeys:@")(8+9)" toCache:cache];
    
    // The first ')' is not a valid key and thus will be ignored.
    expectedArray = @[@"(", @"8", @"+", @"9", @")"];
    XCTAssert([cache.inputArray isEqualToArray:expectedArray]);
    
    cache = [[KeyCache alloc] init];
    [self addKeys:@"((8+9)+10)" toCache:cache];
    expectedArray = @[@"(", @"(", @"8", @"+", @"9", @")", @"+", @"10", @")"];
    XCTAssert([cache.inputArray isEqualToArray:expectedArray]);

    [self expectInputArray:@"8+9+(10)"
                 matchWith:@[@"8", @"+", @"9", @"+", @"(", @"10", @")"]];
    [self expectInputArray:@"8+((10+1)+2)"
                 matchWith:@[@"8", @"+", @"(", @"(", @"10", @"+", @"1", @")", @"+", @"2", @")"]];
    
}

- (void) testKeyWithSubtract {
    [self expectInputArray:@"-9" matchWith:@[@"-9"]];
    [self expectInputArray:@"8-9" matchWith:@[@"8", @"-", @"9"]];
    [self expectInputArray:@"8*-9" matchWith:@[@"8", @"*", @"-9"]];
    [self expectInputArray:@"-8*-9" matchWith:@[@"-8", @"*", @"-9"]];
    [self expectInputArray:@"-8*9" matchWith:@[@"-8", @"*", @"9"]];
}

- (void) testKeyWithDots {
    [self expectInputArray:@".9" matchWith:@[@".9"]];
    [self expectInputArray:@"9." matchWith:@[@"9."]];
    [self expectInputArray:@"9.8" matchWith:@[@"9.8"]];

    [self expectInputArray:@"1 + 0.2" matchWith:@[@"1", @"+", @"0.2"]];
    [self expectInputArray:@"1 * .2" matchWith:@[@"1", @"*", @".2"]];
    
    [self expectInputArray:@"1 - 2." matchWith:@[@"1", @"-", @"2."]];
    [self expectInputArray:@"1 / ." matchWith:@[@"1", @"/", @"."]];
}

- (void) testInvalidKeyCases {
    [self expectInputArray:@")" matchWith:@[]];
    [self expectInputArray:@"*" matchWith:@[]];
    [self expectInputArray:@"+12" matchWith:@[@"12"]];
    [self expectInputArray:@"/5" matchWith:@[@"5"]];
    [self expectInputArray:@"-12" matchWith:@[@"-12"]];
    
    [self expectInputArray:@"(+1" matchWith:@[@"(", @"1"]];
    [self expectInputArray:@"(-2" matchWith:@[@"(", @"-2"]];
    [self expectInputArray:@"(*3" matchWith:@[@"(", @"3"]];

}




@end
