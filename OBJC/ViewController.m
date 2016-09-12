//
//  ViewController.m
//  OBJC
//
//  Created by Filipe Jordão on 8/10/16.
//  Copyright © 2016 Filipe Jordão. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    CloudKitHelper * cloudkit;
    __weak IBOutlet UITableView *tableview;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    cloudkit = [[CloudKitHelper alloc] init];
    cloudkit -> tableview2 = tableview;
    tableview.delegate = cloudkit;
    tableview.dataSource = cloudkit;


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)manda:(id)sender {
    [cloudkit saveRecord: @"mandou"];
}
- (IBAction)update:(id)sender {
    [cloudkit fetchTodos];
}

@end
