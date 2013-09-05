//
//  ViewController.m
//  ManagerMusic_V2
//
//  Created by ios15 on 6/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  // NSString *path;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     //NSString *path = @"/Users/ios15/Desktop/self_CODE/ManagerMusic_V2/ManagerMusic_V2.txt";
    _singer_Names = [[NSMutableArray alloc]init];
    _song_Names   = [[NSMutableArray alloc]init];
    _album_Names  = [[NSMutableArray alloc]init];
    _managerMusic = [[NSMutableArray alloc]init];
  
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

- (IBAction)submit:(id)sender {
       [self prepareData];
       [self deletaData];
   

}

- (void) deletaData
{
       self.nameSinger.text = @" ";
       self.nameSong.text   = @" ";
       self.nameAlbum.text  = @" ";

}

- (void) prepareData
{
    NSString *nameSingers = self.nameSinger.text;
    NSString *nameSongs   = self.nameSong.text;
    NSString *nameAlbums  = self.nameAlbum.text;
    
    Singer *nameSi =[[Singer alloc]initWithSinger:nameSingers];
    Song *nameSo = [[Song alloc]initWithName:nameSongs];
    Album *nameAl = [[Album alloc]initWithNameAlbum:nameAlbums];
    ManagerMusic *manager = [[ManagerMusic alloc]initWithNameSinger:nameSingers
                                                           nameSong:nameSongs
                                                          nameAlbum:nameAlbums];
            
    [_singer_Names addObject:nameSi];
    [_song_Names addObject:nameSo];
    [_album_Names addObject:nameAl];
    [_managerMusic addObject:manager];
    
    self.number.text = [NSString stringWithFormat:@"%i",[_managerMusic count]];
   
    NSLog(@"%@",_managerMusic);
    NSLog(@"%@",_singer_Names);
    NSLog(@"%@",_song_Names);
    NSLog (@"%@",_album_Names);
    
//    NSString *paht = @"/Users/ios15/Desktop/self_CODE/ManagerMusic_V2/ManagerMusic_V2.txt";
//    [_managerMusic writeToFile:paht atomically:YES];
    
}
- (IBAction)random:(id)sender {
    [self randomSinger];
}
- (IBAction)searchNameSinger:(id)sender {

    NSPredicate *singerSearch = [NSPredicate predicateWithFormat:@"nameSinger contains[c] %@",self.nameSingerSearch.text];
    NSArray *resul = [_singer_Names filteredArrayUsingPredicate:singerSearch];
    NSLog(@"%@",resul);
    
}
- (IBAction)searchNameSong:(id)sender {
    NSPredicate *songSearch = [NSPredicate predicateWithFormat:@"nameSong contains[c] %@",self.nameSongSearch.text];
    NSArray *resuls = [_song_Names filteredArrayUsingPredicate:songSearch];
    NSLog(@"%@",resuls);
}
- (IBAction)searchNameAlbum:(id)sender {
    NSPredicate *albumSearch = [NSPredicate predicateWithFormat:@"nameAlbum contains[c] %@",self.nameAlbumSearch.text];
    NSArray *resulss = [_album_Names filteredArrayUsingPredicate:albumSearch];
    NSLog(@"%@",resulss);
}
- (IBAction)searchManagerMusic:(id)sender {
    NSPredicate *managerMusicSearch = [NSPredicate predicateWithFormat:@"nameSong contains[c] %@",self.searchManager.text];
    NSArray *resulsss = [_managerMusic filteredArrayUsingPredicate:managerMusicSearch];
    NSLog(@"%@",resulsss);
}
- (IBAction)reset:(id)sender {
    [_managerMusic removeAllObjects];
    self.number.text = [NSString stringWithFormat:@"%i",[_managerMusic count]];
}

- (void)randomSinger
{
    int index_name  = arc4random() % [_singer_Names count];
    int index_song  = arc4random() % [_song_Names count];
    int index_album = arc4random() % [_album_Names count];
    
    Singer *randomSinger = [_singer_Names objectAtIndex:index_name];
    Song *randomSong     = [_song_Names objectAtIndex:index_song];
    Album *randomAlbum   = [_album_Names objectAtIndex:index_album];
    ManagerMusic *randomMana = [[ManagerMusic alloc]initWithNameSinger:randomSinger
                                                             nameSong:randomSong
                                                            nameAlbum:randomAlbum];
    NSLog(@"%@",randomMana);
}

@end
