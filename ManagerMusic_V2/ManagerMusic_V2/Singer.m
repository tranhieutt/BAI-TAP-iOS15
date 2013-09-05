//
//  Singer.m
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Singer.h"
#import "Song.h"
#import "Album.h"

@implementation Singer: NSObject   


- (id) initWithSinger: (Singer *) nameSinger
{
    if (self = [super init])
    {
        self.nameSinger = nameSinger;
    }
    return self;
}
- (NSString *) description
{
    NSString *desc = [NSString stringWithFormat:@"%@",self.nameSinger];
    return desc;
}

@end
