//
//  CloudKitHelper.m
//  OBJC
//
//  Created by Filipe Jordão on 8/10/16.
//  Copyright © 2016 Filipe Jordão. All rights reserved.
//

#import "CloudKitHelper.h"


static NSMutableArray<NSString *> *todos;

@implementation CloudKitHelper

- (instancetype) init{
    self = [super init];
    
    todos = [[NSMutableArray<NSString *> alloc]init];
    
    self -> container = [CKContainer defaultContainer];
    self -> publicDB = [container publicCloudDatabase];
    self -> privateDB = [container privateCloudDatabase];
    
    return self;
}

- (void)fetchTodos{
    NSPredicate * predicate = [NSPredicate predicateWithValue:true];
    CKQuery * query = [[CKQuery alloc] initWithRecordType: @"ToDo" predicate: predicate];
    [publicDB performQuery: query inZoneWithID: nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        if (error == nil ){
            todos = [[NSMutableArray<NSString *> alloc]init];
            for (CKRecord * record in results){
                [todos addObject: [record objectForKey:@"todotext"]];
            }
            [self -> tableview2 reloadData];
            return;
        }
        NSLog(@"%@",error);
        return;
    }];
}

- (void)saveRecord:(NSString *)todo
{
    CKRecord * todoRecord = [[CKRecord alloc] initWithRecordType:@"ToDo"];
    [todoRecord setValue: todo forKey:@"todotext"];
    [self -> publicDB saveRecord: todoRecord completionHandler:
     ^(CKRecord * _Nullable record, NSError * _Nullable error)
    {
        if (error){
            NSLog(@"%@", error);
        }else{
        NSLog(@"Saved to cloud kit");
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return todos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = todos[indexPath.row];
    return cell;
}
@end
