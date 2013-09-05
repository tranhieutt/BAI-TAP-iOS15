//
//  ViewControllerG.m
//  t
//
//  Created by ios15 on 7/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewControllerG.h"

@interface ViewControllerG ()

@end

@implementation ViewControllerG

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"fruitLarge.jpg"];
    self.photoView = [[UIImageView alloc]initWithImage:image];
    self.myscrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.myscrollView addSubview:self.photoView];
    self.myscrollView.contentSize = self.photoView.frame.size;
    self.myscrollView.delegate = self;
    [self.view addSubview:self.myscrollView];
    self.myscrollView.indicatorStyle  = UIScrollViewIndicatorStyleWhite;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
