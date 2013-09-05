//
//  ViewController.m
//  HomeWork_Day12
//
//  Created by ios15 on 7/23/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "RunningMan.h"

@interface ViewController ()

@end

@implementation ViewController


RunningMan *manrunning;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     
//    [self displayCity:1];
//    [self displayRunningMan:self.runningMan duration:0.9];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)displayRunningMan: (UIImageView *)man duration:(float) duration
{
    man.animationImages = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"kl2.png"],
                             [UIImage imageNamed:@"kl3.png"],
                             [UIImage imageNamed:@"kl4.png"],
                             [UIImage imageNamed:@"kl5.png"],
                                                         nil];
    [man setAnimationRepeatCount:0];
    [man setAnimationDuration:duration];
    [man startAnimating];
}
- (void)displayCity : (float) duration
{
    
     self.iamageCity.animationImages = [NSArray arrayWithObjects:
             [UIImage imageNamed:@"nui0.png"],
             [UIImage imageNamed:@"nui1.png"],
                                        [UIImage imageNamed:@"nui2.png"],
                                        [UIImage imageNamed:@"nui3.png"],
                                        [UIImage imageNamed:@"nui4.png"],
                                        [UIImage imageNamed:@"nui5.png"],
                                        [UIImage imageNamed:@"nui6.png"],
                                        [UIImage imageNamed:@"nui7.png"],
                                        [UIImage imageNamed:@"nui8.png"],
                                        [UIImage imageNamed:@"nui9.png"],
                                        [UIImage imageNamed:@"nui10.png"],
                                        [UIImage imageNamed:@"nui11.png"],
                                        nil];
    [self.iamageCity setAnimationRepeatCount:0];
    [self.iamageCity setAnimationDuration:duration];
    [self.iamageCity startAnimating];
}
- (IBAction)speed:(UISlider *)sender {
    if ([sender isEqual:self.speed]) {
        
        [self displayCity:sender.value];
        [self displayRunningMan:self.runningMan duration:sender.value];
        NSLog(@",%f",sender.value);

    }
}
@end
