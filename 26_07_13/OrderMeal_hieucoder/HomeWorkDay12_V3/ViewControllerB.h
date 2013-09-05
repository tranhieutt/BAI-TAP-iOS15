//
//  ViewControllerB.h
//  HomeWorkDay12_V3
//
//  Created by ios15 on 7/24/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerB : UIViewController <UIPageViewControllerDataSource>
@property (strong,nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) IBOutlet UIButton *payment;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *payMent;

@end
