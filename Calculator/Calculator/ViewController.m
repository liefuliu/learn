//
//  ViewController.m
//  Calculator
//
//  Created by liefuliu on 7/17/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
//#import "SimpleEvaluator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Touch 0 to 9

- (IBAction)touchZero:(id)sender {
}

- (IBAction)touchOne:(id)sender {
}

- (IBAction)touchTwo:(id)sender {
}
- (IBAction)touchThree:(id)sender {
}
- (IBAction)touchFour:(id)sender {
}
- (IBAction)touchFive:(id)sender {
}
- (IBAction)touchSix:(id)sender {
}
- (IBAction)touchSeven:(id)sender {
}

- (IBAction)touchEight:(id)sender {
}

- (IBAction)touchNine:(id)sender {
    NSLog(@"9 has been touched");
    self.displayPanel.text = [NSString stringWithFormat:@"%@%@", self.displayPanel.text, @"9"];
}
- (IBAction)touchLeftBracket:(id)sender {
}

- (IBAction)touchRightBracket:(id)sender {
}

- (IBAction)touchClear:(id)sender {
}


// Touch +-*/%


- (IBAction)touchPercent:(id)sender {
}

- (IBAction)touchAdd:(id)sender {
    self.displayPanel.text = [NSString stringWithFormat:@"%@%@", self.displayPanel.text, @"+"];
}

- (IBAction)touchSubtract:(id)sender {
}

- (IBAction)touchMultiply:(id)sender {
}

- (IBAction)touchDivide:(id)sender {
}

// Touch = and .

- (IBAction)touchEqual:(id)sender {
    //self.displayPanel.text = [SimpleEvaluator evaluateString:self.displayPanel.text];
}

- (IBAction)touchPoint:(id)sender {
}

@end
