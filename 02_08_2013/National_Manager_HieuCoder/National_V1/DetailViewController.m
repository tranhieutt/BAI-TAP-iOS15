//
//  DetailViewController.m
//  National_V1
//
//  Created by ios15 on 8/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{

    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString:self.detailItem]];
    [self.webView loadRequest:request];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
