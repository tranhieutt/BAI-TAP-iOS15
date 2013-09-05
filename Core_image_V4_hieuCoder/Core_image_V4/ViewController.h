//
//  ViewController.h
//  Core_image_V4
//
//  Created by ios15 on 8/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResizeImage.h"
#import <objc/runtime.h>
@interface ViewController :   UIViewController 
@property  (strong,nonatomic) NSMutableArray *images;
@property  (strong,nonatomic) NSMutableArray    *resizedImages;
@property  (strong,nonatomic) UIImageView *imageOrigin;
@property  (strong,nonatomic) UIImageView *imageResized;
@property  (strong, nonatomic) IBOutlet UISlider *ratio;
@end
