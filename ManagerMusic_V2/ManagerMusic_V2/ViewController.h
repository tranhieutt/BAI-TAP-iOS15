//
//  ViewController.h
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singer.h"
#import "Song.h"
#import "Album.h"
#import "ManagerMusic.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameSinger;
@property (weak, nonatomic) IBOutlet UITextField *nameSong;
@property (weak, nonatomic) IBOutlet UITextField *nameAlbum;
@property (weak, nonatomic) IBOutlet UIButton *submit;

@property (nonatomic,strong) NSMutableArray *singer_Names;

@property (nonatomic,strong) NSMutableArray *song_Names;
@property (nonatomic,strong) NSMutableArray *album_Names
;
@property (nonatomic,strong) NSMutableArray *managerMusic;
@property (weak, nonatomic) IBOutlet UITextField *number;
@property (weak, nonatomic) IBOutlet UIButton *random;
@property (weak, nonatomic) IBOutlet UITextField *nameSingerSearch;
@property (weak, nonatomic) IBOutlet UITextField *nameSongSearch;
@property (weak, nonatomic) IBOutlet UITextField *nameAlbumSearch;
@property (weak, nonatomic) IBOutlet UIButton *searchNameSinger;
@property (weak, nonatomic) IBOutlet UIButton *searchNameSong;
@property (weak, nonatomic) IBOutlet UIButton *searchNameAlbum;
@property (weak, nonatomic) IBOutlet UITextField *searchManager;
@property (weak, nonatomic) IBOutlet UIButton *searchMangerMusic;

@property (weak, nonatomic) IBOutlet UIButton *reset;




- (void) prepareData;
- (void) deleteData;
- (void) randomSinger;
@end
