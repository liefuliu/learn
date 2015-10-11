//
//  ViewController.h
//  testThread
//
//  Created by Liefu Liu on 10/11/15.
//  Copyright (c) 2015 Liefu Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *label;
typedef void(^ApiCompletion)(float);
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

