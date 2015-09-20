//
//  ClassViewController.m
//  TestPB
//
//  Created by Liefu Liu on 9/19/15.
//  Copyright (c) 2015 Liefu Liu. All rights reserved.
//

#import "ClassViewController.h"
#import "Class.pb.h"

@interface ClassViewController ()

@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self initializeClassInfo];
}

- (void) initializeClassInfo {
    ClassInfo* person = [[[[[ClassInfo builder] setProject:@"Math"]
                        setTeacher:@"Liefu"]
                       setPrice:100] build];
    self.textFieldProject.text = person.project;
    self.textFieldTeacher.text = person.teacher;
    self.textFieldPrice.text = [@(person.price) stringValue];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
@end
