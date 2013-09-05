//
//  ViewControllerH.m
//  t
//
//  Created by ios15 on 7/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewControllerH.h"

@interface ViewControllerH ()

@end

@implementation ViewControllerH

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)url:(UIBarButtonItem *)sender {
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=AhTtwpWQyqI"]];
    [self.webView loadRequest:request];
}


//- (IBAction)btn:(id)sender {
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://www.knotts.com/california-marketplace/mrs-knott-s-chicken-dinner-restaurant"]];
//    [self.webView loadRequest:request];
//   https://www.knotts.com/california-marketplace/mrs-knott-s-chicken-dinner-restaurant 
//}


@end
