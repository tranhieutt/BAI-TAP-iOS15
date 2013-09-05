//
//  MasterViewController.h
//  Device_V6
//
//  Created by ios15 on 8/7/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController <UISearchBarDelegate,UISearchDisplayDelegate>
@property (strong,nonatomic) NSMutableArray *deviceArray;
@property (strong,nonatomic) NSMutableArray *fiteredDeviceArray;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarDevice;

@end
