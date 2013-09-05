//
//  Car.h
//  CarModel
//
//  Created by ios15 on 6/9/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
-(id) init:(NSString *)name;
- (void) run:(float) fuel:(float)speed;

@end