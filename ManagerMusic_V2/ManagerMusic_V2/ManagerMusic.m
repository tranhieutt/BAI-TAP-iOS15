//
//  ManagerMusic.m
//  ManagerMusic_V2
//
//  Created by ios15 on 6/27/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ManagerMusic.h"

@implementation ManagerMusic
- (id) initWithNameSinger:(Singer *)nameSinger
                 nameSong:(Song *)nameSong
                nameAlbum:(Album *)nameAlbum
               
{
    if (self = [super init])
    {
        self.nameSinger = nameSinger;
        self.nameSong   = nameSong;
        self.nameAlbum = nameAlbum;
    }
    return  self;
}
- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@" %@,  %@,  %@",self.nameSinger,self.nameSong,self.nameAlbum];
    return desc;
}
@end
