//
//  DataController.h
//  National_V1
//
//  Created by ios15 on 8/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Play;
@interface DataController : NSObject
- (unsigned) countOfList;
- (Play *)objectInListAtIndex: (unsigned) theIndex;

@end
