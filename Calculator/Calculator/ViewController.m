//
//  ViewController.m
//  Calculator
//
//  Created by liefuliu on 7/17/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import "KeyCache.h"
#import "SimpleEvaluator.h"

@interface ViewController ()

@property (nonatomic, strong) KeyCache* keyCache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.keyCache = [[KeyCache alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Touch 0 to 9

- (IBAction)touchZero:(id)sender {
    [self.keyCache pressKey:'0'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchOne:(id)sender {
    [self.keyCache pressKey:'1'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchTwo:(id)sender {
    [self.keyCache pressKey:'2'];
    self.displayPanel.text = self.keyCache.displayText;
}
- (IBAction)touchThree:(id)sender {
    [self.keyCache pressKey:'3'];
    self.displayPanel.text = self.keyCache.displayText;
}
- (IBAction)touchFour:(id)sender {
    [self.keyCache pressKey:'4'];
    self.displayPanel.text = self.keyCache.displayText;
}
- (IBAction)touchFive:(id)sender {
    [self.keyCache pressKey:'5'];
    self.displayPanel.text = self.keyCache.displayText;
}
- (IBAction)touchSix:(id)sender {
    [self.keyCache pressKey:'6'];
    self.displayPanel.text = self.keyCache.displayText;
}
- (IBAction)touchSeven:(id)sender {
    [self.keyCache pressKey:'7'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchEight:(id)sender {
    [self.keyCache pressKey:'8'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchNine:(id)sender {
    [self.keyCache pressKey:'9'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchLeftBracket:(id)sender {
    [self.keyCache pressKey:'('];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchRightBracket:(id)sender {
    [self.keyCache pressKey:')'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchClear:(id)sender {
    [self.keyCache clear];
    self.displayPanel.text = self.keyCache.displayText;
}


// Touch +-*/%


- (IBAction)touchPercent:(id)sender {
}

- (IBAction)touchAdd:(id)sender {
    [self.keyCache pressKey:'+'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchSubtract:(id)sender {
    [self.keyCache pressKey:'-'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchMultiply:(id)sender {
    [self.keyCache pressKey:'*'];
    self.displayPanel.text = self.keyCache.displayText;
}

- (IBAction)touchDivide:(id)sender {
    [self.keyCache pressKey:'/'];
    self.displayPanel.text = self.keyCache.displayText;
}

// Touch = and .

- (IBAction)touchEqual:(id)sender {
    NSString* result = [SimpleEvaluator evaluateString:[self.keyCache inputArray]];
    
    if (result) {
        self.displayPanel.text = result;
    } else {
        self.displayPanel.text = @"ERROR";
    }
    
    [self.keyCache clear];
}

- (IBAction)touchPoint:(id)sender {
    [self.keyCache pressKey:'.'];
    self.displayPanel.text = self.keyCache.displayText;
}

@end
