//
//  MasterViewController.h
//  National_V1
//
//  Created by ios15 on 8/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterViewController;
@interface MasterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,retain) NSMutableArray *data;
@end
