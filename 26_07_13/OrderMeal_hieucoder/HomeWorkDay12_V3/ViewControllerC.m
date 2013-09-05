//
//  ViewControllerC.m
//  HomeWorkDay12_V3
//
//  Created by ios15 on 7/24/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewControllerC.h"


@interface ViewControllerC ()

@end

@implementation ViewControllerC

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
    _text.text = [NSString stringWithFormat:@"Pizza code %d",self.index];
    CGRect frame = CGRectMake(0,0,320,250);
    _imageView = [[UIImageView alloc]initWithFrame:frame];
    
    [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"p%d.jpeg",self.index]]];
    [self.view addSubview:_imageView];
    [self.view addSubview:_text];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
