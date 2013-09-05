//
//  Song.h
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
@property (nonatomic,strong) Song *nameSong;

-(id) initWithName: (Song *)namesong;
@end
