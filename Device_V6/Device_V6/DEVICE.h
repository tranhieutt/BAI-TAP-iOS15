//
//  DEVICE.h
//  CandySearch
//
//  Created by ios15 on 8/7/13.
//  Copyright (c) 2013 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEVICE : NSObject
{
    NSString *operationSystem;
    NSString *name;
    NSString *price;
    UIImage *imageView;

    
}

@property (nonatomic,strong) NSString *operationSystem;
@property (nonatomic,copy)   NSString *name;
@property (nonatomic,copy)   NSString *price;
@property (nonatomic,copy)   UIImage *imageView;
@property (nonatomic,copy)   UIView  *contentView;
+ (id) operationSystemsDevice: (NSString *)operationSystem
                         name: (NSString *)name
                        price: (NSString *)price
                    imageView: (UIImage *)imageView;
@end


