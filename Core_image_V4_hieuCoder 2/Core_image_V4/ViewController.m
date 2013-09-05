//
//  ViewController.m
//  Core_image_V4
//
//  Created by ios15 on 8/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "ResizeImage.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _resizedImages = [[NSMutableArray alloc]init];
}
- (IBAction)ratio:(UISlider *)sender
{
    if ([sender isEqual:self.ratio])
    {
        NSDate *startime = [NSDate date];
        
        [self initImageArrays];
        
         dispatch_queue_t myQueue                                 = dispatch_queue_create("hieuCoder", DISPATCH_QUEUE_CONCURRENT );
                                  // Khoi tao hang queue : xep hang doi xu ly
        for (int i = 0; i < [_images count]; i++) 
        {
            dispatch_async(myQueue,
                ^{
                                       ResizeImage *newImage      = [[ResizeImage alloc]init];
                                       UIImage *temp              = [UIImage imageNamed:[_images objectAtIndex:i]];
                                       UIImage *img               = [newImage resizeImage:temp width:sender.value];
                                       [_resizedImages addObject:img];
                    
                    
                   // NSLog(@"Done %@",[_resizedImages count]);
                     dispatch_async(dispatch_get_main_queue(),
                                  ^{
                                       CGRect frame               = CGRectMake(10+50*i,0+60*i,img.size.width, img.size.height);
                                       _imageResized              = [[UIImageView alloc]initWithFrame:frame];
                                       [_imageResized setImage:img];
                                       [self.view addSubview: _imageResized];
// NSLog(@" Size goc %1.0f %1.0f ",temp.size.width,temp.size.height);
// NSLog(@"Size anh sau khi resize %1.0f %1.0f",img.size.width,img.size.height);
                               
                                   });
                 });
       }
    
        NSDate *endtime = [NSDate date];
        NSLog(@" Complete Time   %f",[endtime timeIntervalSinceDate:startime]);
   }    
  
}

- (IBAction)ResizeImage:(NSMutableArray *)images
{
     NSDate *startime = [NSDate date];
     [self initImageArrays];

    dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0 ) ;        //dispatch_queue_create("hieuCoder", DISPATCH_QUEUE_SERIAL);// Day la dispatch_private_queue
    // LOW_ phan bo ra cac thread tu 2 den 10 11
    
    
    for (int i = 0; i < [_images count]; i++)
    {
        dispatch_async(myQueue,
            ^{
                            ResizeImage *newImage = [[ResizeImage alloc]init];
                            UIImage *temp         = [UIImage imageNamed:[_images objectAtIndex:i]];
                            UIImage *img          = [newImage resizeImage:temp width:0.05];
                            [_resizedImages addObject:img];
              
            dispatch_async(dispatch_get_main_queue(),
                         ^{
                            CGRect frame          = CGRectMake(10+50*i,10+60*i,img.size.width, img.size.height);
                            _imageResized         = [[UIImageView alloc]initWithFrame:frame];
                            [_imageResized setImage:img];
                            [self.view addSubview:_imageResized];
//NSLog(@" Size goc %1.0f %1.0f ",temp.size.width,temp.size.height);
//NSLog(@"Size anh sau khi resize %1.0f %1.0f",img.size.width,img.size.height);
                             
                         });
             });
    }
    NSDate *endtime = [NSDate date];
    NSLog(@" Complete time:   %f",[endtime timeIntervalSinceDate:startime]);
    NSLog(@"done %d",[_resizedImages count]);
}
- (void) initImageArrays
{
    _images = [NSMutableArray arrayWithObjects:@"anh4.jpg",@"anh6.jpeg",@"anh5.jpg",@"anh8.jpg",@"anh7.jpg", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
