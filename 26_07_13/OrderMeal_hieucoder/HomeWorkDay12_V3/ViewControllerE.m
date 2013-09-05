//
//  ViewControllerE.m
//  t
//
//  Created by ios15 on 7/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewControllerE.h"

@interface ViewControllerE ()

@end

@implementation ViewControllerE

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
    CGRect frame = CGRectMake(0,0,320,250);
    _imageView = [[UIImageView alloc]initWithFrame:frame];
    
    [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"k%d.jpeg",self.index]]];
    [self.view addSubview:_imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
