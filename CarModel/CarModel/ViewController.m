//
//  ViewController.m
//  CarModel
//
//  Created by ios15 on 6/9/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)runCar:(id)sender {
    Car *car=[[Car alloc] init];
    float fuel=100;
    float speed=50;
    
    [car run:(float) fuel:(float)speed];
    
    
    
    

}

@end
