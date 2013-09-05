//
//  ManagerMusic.h
//  ManagerMusic_V2
//
//  Created by ios15 on 6/27/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singer.h"
#import "Song.h"
#import "Album.h"

@interface ManagerMusic : NSObject
@property (nonatomic,strong) Singer *nameSinger;
@property (nonatomic,strong) Song *nameSong;
@property (nonatomic,strong) Album *nameAlbum;

- (id) initWithNameSinger: (Singer *)nameSinger
                 nameSong: (Song *) nameSong
                nameAlbum: (Album *)nameAlbum;
@end
