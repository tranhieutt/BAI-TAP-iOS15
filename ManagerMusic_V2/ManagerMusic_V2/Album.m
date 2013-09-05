//
//  Album.m
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Album.h"

@implementation Album
- (id)initWithNameAlbum:(Album *)nameAlbum
{
    if (self = [super init])
    {
        self.nameAlbum = nameAlbum;
    }
    return  self;
}
- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@" %@",self.nameAlbum];
    return desc;
}
@end
