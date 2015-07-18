//
//  SimpleEvaluatorTest.m
//  Calculator
//
//  Created by liefuliu on 7/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SimpleEvaluator.h"
@interface SimpleEvaluatorTest : XCTestCase

@end

@implementation SimpleEvaluatorTest

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


- (void) testEvaluationSimpleAdd {
    NSArray* input = @[@"12", @"+", @"3"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"15"]);
}


- (void) testEvaluationSimpleSubstract {
    NSArray* input = @[@"12", @"-", @"3"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"9"]);
}


- (void) testEvaluationSubstractToNegative {
    NSArray* input = @[@"3", @"-", @"6"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"-3"]);
}


- (void) testEvaluationAddNegativeCombine {
    NSArray* input = @[@"3", @"-", @"6", @"+", @"1"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"-2"]);
    
}

- (void) testEvaulationSimpleInteger {
    NSArray* input = @[@"3"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"3"]);
}

- (void) testEvaluationOnlyBracket {
    NSArray* input = @[@"(", @"3", @")"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"3"]);

}

- (void) testEvaluationBracketWithAddSub {
    NSArray* input = @[@"1", @"-", @"(", @"3", @"+", @"6", @")", ];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"-8"]);
    
    
    input = @[@"(", @"1", @"+", @"3",@")", @"-", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    XCTAssert([result isEqualToString:@"2"]);

}

- (void) testSimpleMultiply {
    NSArray* input = @[@"2", @"*", @"3", ];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"6"]);
    
    
    input = @[@"2", @"*", @"3", @"*", @"4"];
    result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"24"]);
}


- (void) testSimpleDivide {
    NSArray* input = @[@"6", @"/", @"3", @"/", @"2"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"1"]);
    
    
    input = @[@"6", @"/", @"3"];
    result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"2"]);
}

- (void) testCombineWithAddMultply {
    NSArray* input = @[@"6", @"+", @"3", @"*", @"2"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"12"]);
    
    
    input = @[@"6", @"*", @"3", @"+", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"20"]);

}


- (void) testCombineWithSubDivide {
    NSArray* input = @[@"8", @"-", @"4", @"/", @"2"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"6"]);
    
    
    input = @[@"8", @"/", @"4", @"-", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"0"]);
    
    input = @[@"8", @"/", @"4", @"-", @"2", @"/", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    
    XCTAssert([result isEqualToString:@"1"]);
}

// Failed cases

- (void) testEvaluationErrorcases {
    NSArray* input = @[@"+"];
    NSString* result = [SimpleEvaluator evaluateString:input];
    XCTAssertNil(result);
    
    input = @[@"("];
    result = [SimpleEvaluator evaluateString:input];
    XCTAssertNil(result);
    
    input = @[@"1", @")", @"+", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    XCTAssertNil(result);
    
    // (1+3))+2
    input = @[@"(", @"1", @"+", @"3",@")", @")", @"+", @"2"];
    result = [SimpleEvaluator evaluateString:input];
    XCTAssertNil(result);
    
    // ((1+3)+2
    input = @[@"(", @"(", @"1", @"+", @"3",@")", @"+", @"2"];

    result = [SimpleEvaluator evaluateString:input];
    XCTAssertNil(result);
    
    
}



@end
