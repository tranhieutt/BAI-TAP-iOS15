//
//  Singer.h
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "Album.h"

@interface Singer : NSObject
@property (nonatomic,strong) Singer *nameSinger;
- (id) initWithSinger: (Singer *) nameSinger;


@end
