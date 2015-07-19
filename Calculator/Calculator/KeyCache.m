//
//  KeyCache.m
//  Calculator
//
//  Created by Liefu Liu on 7/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "KeyCache.h"

@interface KeyCache()

@property (nonatomic, strong) NSString* displayText;
@property (strong) NSMutableArray* inputArray;



@end

@implementation KeyCache

//bool isLastInputDigit;
char _lastKey;
int _leftBrackets;

+ (bool) isDigit:(char) key {
    return (key >= '0' && key <= '9') || key == '.';
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.displayText = @"";
        self.inputArray = [[NSMutableArray alloc] init];
        //isLastInputDigit = false;
        
        _lastKey = '\0';
        _leftBrackets = 0;
    }
    return self;
}
- (void) pressKey:(char) key {
    // Starting point is treated as following a non digit non )
    
    // If a digit follow a digit or a '!', append
    // If a digit, otherwise, add a new element.
    // If a *+/,
    //   if follow a digit, append
    //   if follow a sign, ignore
    //   if follow a (, ignore
    //   if follow a ), append
    //   otherwise, ignore
    // If a -
    //   if follow a digit or (, or '\0', add a new element '-' and mark isDigit
    //   if follow a *+/-), add a new element only '!'
    // If a (
    //   if follow a digit or ), ignore
    //   otherwise, append. (left brackets++)
    // If a )
    //   if follow a non digit or (, ignore
    //   if left brackets num == 0, ignore
    //   otherwise, append. (left brackets--)
    
    
    /*
    bool isValidKey = true;
    if ((key >= '0' && key <= '9') || key == '.' ) {
        if (isLastInputDigit) {
            NSString* lastElement = self.inputArray[self.inputArray.count - 1] ;
            self.inputArray[self.inputArray.count - 1] = [NSString stringWithFormat:@"%@%c", lastElement, key];
            
            // TODO(verify digit).
        }
        else {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
        }
        isLastInputDigit = true;
    } else if (key == '-' && !isLastInputDigit){
        [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
        isLastInputDigit = true;
    } else {
        if (isLastInputDigit) {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
            isLastInputDigit = false;
        } else if (key == '(') {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
            isLastInputDigit = false;
        } else {
            isValidKey = false;
        }
    }*/
    
    bool isValidKey = true;
    
    
    if ([KeyCache isDigit:key]) {
        if ([KeyCache isDigit:_lastKey] || _lastKey == '!') {
            NSString* lastElement = self.inputArray[self.inputArray.count - 1] ;
            self.inputArray[self.inputArray.count - 1] = [NSString stringWithFormat:@"%@%c", lastElement, key];
        }
        else {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
        }
        _lastKey = key;
    } else if (key == '-') {
        if (_lastKey == '!'){
            isValidKey = false;
        } else {
            if ([KeyCache isDigit:_lastKey]) {
                _lastKey = '-';
            } else {
                _lastKey = '!';
            }
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
        }
    } else if (key == '+' || key == '*' || key == '/') {
        if ([KeyCache isDigit:_lastKey] || _lastKey == ')') {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
            _lastKey = key;
        } else {
            isValidKey = false;
        }
    } else if (key == '(') {
        if ([KeyCache isDigit:_lastKey] || _lastKey == '!' || _lastKey == ')') {
            isValidKey = false;
        } else {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
            _lastKey = key;
            ++_leftBrackets;
        }
    } else if (key == ')') {
        if (_leftBrackets == 0) {
            isValidKey = false;
        } else if ([KeyCache isDigit:_lastKey] || _lastKey == ')') {
            [self.inputArray addObject:[NSString stringWithFormat:@"%c", key]];
            _lastKey = key;
            --_leftBrackets;
        } else {
            isValidKey = false;
        }
    } else {
        // Ignore
        
    }
    
    if (isValidKey) {
        self.displayText = [NSString stringWithFormat:@"%@%c", self.displayText, key];
    }
}


- (void) clear {
    _leftBrackets = 0;
    _lastKey = '\0';
    self.displayText = @"";
    [self.inputArray removeAllObjects];
}


@end
