//
//  SimpleEvaluator.m
//  Calculator
//
//  Created by liefuliu on 7/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "SimpleEvaluator.h"

@implementation SimpleEvaluator

+ (bool) isStringDecimalNumber:(NSString*) stringValue
{
    bool result = false;
    
    NSString *decimalRegex = @"^(?:|-)(?:|0|[1-9]\\d*)(?:\\.\\d*)?$";
    NSPredicate *regexPredicate =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", decimalRegex];
    
    if ([regexPredicate evaluateWithObject: stringValue]){
        result = true;
    }
    
    return result;
}

+ (NSString*) evaluateString: (NSArray*) inputArray {
    if (inputArray.count == 0) {
        return nil;
    }
    
    if (inputArray.count == 1) {
        if ([SimpleEvaluator isStringDecimalNumber:inputArray[0] ]) {
            return inputArray[0];
        }
        return nil;
    }
    
    int leftBrackets = 0;
    int leftBracketsStartAt = -10;
    int currentIndex = 0;
    for (NSString* input in inputArray) {
        if ([input isEqualToString:@"("]){
            if (leftBrackets == 0) {
                leftBracketsStartAt = currentIndex;
            }
            leftBrackets++;
        } else if ([input isEqualToString:@")"]) {
            leftBrackets--;
            if (leftBrackets < 0) {
                return nil;
            }
            if (leftBrackets == 0) {
                // Found the maximum bracket pair, compute the operand inside.
                NSArray* arrayInBrackets = [inputArray subarrayWithRange:NSMakeRange(leftBracketsStartAt + 1, currentIndex - leftBracketsStartAt - 1)];
                NSString* valueInBrackets = [SimpleEvaluator evaluateString:arrayInBrackets];
                
                if (valueInBrackets == nil) {
                    return nil;
                }
                
                NSMutableArray* newArray = [[NSMutableArray alloc] init];
                
                NSArray* arrayLeftToBracket = [inputArray subarrayWithRange:NSMakeRange(0, leftBracketsStartAt)];
                
                if (leftBracketsStartAt > 0) {
                    [newArray addObjectsFromArray:arrayLeftToBracket];
                }
                
                [newArray addObject:valueInBrackets];
                if (currentIndex + 1 < inputArray.count) {
                    NSArray* arrayRightToBracket = [inputArray subarrayWithRange:
                                                    NSMakeRange(currentIndex + 1, inputArray.count - currentIndex - 1)];
                    [newArray addObjectsFromArray:arrayRightToBracket];
                }
                
                // Compute the new array
                return [SimpleEvaluator evaluateString:newArray];
            }
        }
        ++currentIndex;
    }
    
    if (leftBracketsStartAt >= 0) {
        return nil;
    }
    
    // Now there are only +-*/.
    for (int i = inputArray.count - 1; i >= 0; i--) {
        NSString* input = inputArray[i];
        
        if ([input isEqualToString:@"+"] ||
            [input isEqualToString:@"-"]) {
        
            if (i == inputArray.count - 1 || i == 0) {
                return nil;
            }
            
            NSString* left =[SimpleEvaluator evaluateString:[inputArray subarrayWithRange:NSMakeRange(0, i)]];
            if (left == nil) {
                return left;
            }
            
            NSString* right =[SimpleEvaluator evaluateString:[inputArray subarrayWithRange:NSMakeRange(i + 1, inputArray.count  - i - 1)]];
            if (right == nil) {
                return right;
            }
            
            if ([left rangeOfString:@"."].length != 0 || [right rangeOfString:@"."].length != 0) {
                if ([input isEqualToString:@"+"]) {
                    double result = [left doubleValue] + [right doubleValue];
                    return [NSString stringWithFormat:@"%g", result];
                } else {
                    double result = [left doubleValue] - [right doubleValue];
                    return [NSString stringWithFormat:@"%g", result];
                }
            } else {
                if ([input isEqualToString:@"+"]) {
                    int result = [left intValue] + [right intValue];
                    return [NSString stringWithFormat:@"%d", result];
                } else {
                    int result = [left intValue] - [right intValue];
                    return [NSString stringWithFormat:@"%d", result];
                }
            }
        }
    }
    
    // Now there are only * and /
    for (int i = inputArray.count - 1; i >= 0; i--) {
        NSString* input = inputArray[i];
        
        if ([input isEqualToString:@"*"] ||
            [input isEqualToString:@"/"]) {
            
            if (i == inputArray.count - 1 || i == 0) {
                return nil;
            }
            
            NSString* left =[SimpleEvaluator evaluateString:[inputArray subarrayWithRange:NSMakeRange(0, i)]];
            if (left == nil) {
                return left;
            }
            
            NSString* right =[SimpleEvaluator evaluateString:[inputArray subarrayWithRange:NSMakeRange(i + 1, inputArray.count  - i - 1)]];
            if (right == nil) {
                return right;
            }
            
            if ([left rangeOfString:@"."].length != 0 || [right rangeOfString:@"."].length != 0) {
                if ([input isEqualToString:@"*"]) {
                    double result = [left doubleValue] * [right doubleValue];
                    return [NSString stringWithFormat:@"%g", result];
                } else {
                    if ([right doubleValue] == 0.0) {
                        return nil;
                    }
                    double result = [left doubleValue] / [right doubleValue];
                    return [NSString stringWithFormat:@"%g", result];
                }
            } else {
                if ([input isEqualToString:@"*"]) {
                    int result = [left intValue] * [right intValue];
                    return [NSString stringWithFormat:@"%d", result];
                } else {
                    if ([right intValue] == 0) {
                        return nil;
                    }
                    if ([left intValue] % [right intValue] == 0) {
                        int result = [left intValue] / [right intValue];
                        return [NSString stringWithFormat:@"%d", result];
                    }
                    else {
                        double result = [left intValue] * 1.0 / [right intValue];
                        return [NSString stringWithFormat:@"%g", result];
                    }
                }
            }
        }
    }
    
    return nil;
    
    // evaluate 18 + 19 * 20
    // evaluate (1+2) * 3
    // ((2+1) * (2*3)) + 6
    
    // convert to stack
    //['(', 25, '+']
}

@end
