//
//  Song.m
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Song.h"

@implementation Song

-(id) initWithName: (Song *)namesong
{
    if (self = [super init])
    {
        self.nameSong = namesong;
    }
    return self;
}
- (NSString *) description
{
    NSString *desc = [NSString stringWithFormat:@"%@",self.nameSong];
    return desc;
}
@end
