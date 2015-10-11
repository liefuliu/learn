//
//  ViewController.m
//  testThread
//
//  Created by Liefu Liu on 10/11/15.
//  Copyright (c) 2015 Liefu Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

ApiCompletion _completionHandler;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.progress = 0.9;
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClicked:(id)sender {
    //[self testThread2:sender];
    [self testThread];
}

- (void) testThread2:(id)sender {
    //Create the block that we wish to run on a different thread.
    void (^progressBlock)(void);
    progressBlock = ^{
        
        [self.progressView setProgress:0.0 animated:YES];
        //[self.progressView animationDidSt:sender];
        //self.progressView.progress = 0.9;
        // self.progressView start
        BOOL running = YES; // this is a instance variable
        
        int i = 0;
        int processAmount = 10000;
        while (running) {
            if (i++ >= processAmount) { // processAmount is something like 1000000
                running = NO;
                continue;
            }
            
            // Update progress bar
            double progr = (double)i / (double)processAmount;
            NSLog(@"progr: %f", progr); // Logs values between 0.0 and 1.0
            
            //NOTE: It is important to let all UI updates occur on the main thread,
            //so we put the following UI updates on the main queue.
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressView setProgress:progr animated:YES];
                [self.progressView setNeedsDisplay];
            });
            
            // Do some more hard work here...
        }
        
    }; //end of progressBlock
    
    //Finally, run the block on a different thread.
    dispatch_queue_t queue = dispatch_get_global_queue(0,0);
    dispatch_async(queue,progressBlock);
}

- (void) testThread {
    __block BOOL successful;
    
    NSLog(@"start dispatch_semaphore_create");
    //dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSLog(@"start run computeFactorial");
    dispatch_queue_t queue = dispatch_get_global_queue(0,0);
    
    dispatch_async(queue, ^{
    [self computeFactorial:1000000 completion:^(float progress) {
            NSLog(@"progress: %f", progress);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"progress in main: %f", progress);
                self.progressView.progress = progress;
                self.label.text = [NSString stringWithFormat:@"progress: %f ", progress ];
                
                [self.progressView setNeedsDisplay];
                [self.label setNeedsDisplay];
            });
            if (progress == 1) {
                //dispatch_semaphore_signal(semaphore);
                NSLog(@"Progress complete");
            }
        }];
    });
    

    NSLog(@"start dispatch_semaphore_wait");
    //dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"dispatch_semaphore_wait finished");
}

- (void) computeFactorial:(int) n
               completion:(ApiCompletion) completionblock {
    _completionHandler = [completionblock copy];
    for (int i = 0; i < 5; i++) {
        _completionHandler(0.1 * i);
        sleep(1);
    }
    _completionHandler(1.0);
}

@end
