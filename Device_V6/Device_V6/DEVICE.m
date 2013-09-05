//
//  DEVICE.m
//  CandySearch
//
//  Created by ios15 on 8/7/13.
//  Copyright (c) 2013 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import "DEVICE.h"

@implementation DEVICE
@synthesize operationSystem;
@synthesize name;
@synthesize price;
@synthesize imageView;
+ (id) operationSystemsDevice: (NSString *)operationSystem
                         name: (NSString *)name
                        price: (NSString *)price
                    imageView: (UIImage *)imageView;
{
    DEVICE *newDevice = [[self alloc]init];
    [newDevice setOperationSystem:operationSystem];
    [newDevice setName:name];
    [newDevice setPrice:price];
    [newDevice setImageView:imageView];
    return newDevice;
}
@end

