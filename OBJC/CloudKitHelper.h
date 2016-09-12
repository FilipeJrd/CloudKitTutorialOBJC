//
//  CloudKitHelper.h
//  OBJC
//
//  Created by Filipe Jordão on 8/10/16.
//  Copyright © 2016 Filipe Jordão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudKit/CloudKit.h>
#import <UIKit/UIKit.h>

@interface CloudKitHelper : NSObject <UITableViewDataSource, UITableViewDelegate>  {
    
    CKContainer * container;
    CKDatabase * publicDB;
    CKDatabase * privateDB;
    @public UITableView * tableview2;
    
}

//@property UITableView* tableview;

- (void) saveRecord: (NSString*) todo;
- (void) fetchTodos;
@end
