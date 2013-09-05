//
//  ResizeImage.m
//  Core_image_V4
//
//  Created by ios15 on 8/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ResizeImage.h"

@implementation ResizeImage
-(UIImage *)resizeImage:(UIImage *)image width:(float) ratio
{
    float actulHeght = image.size.height ;
    float actulWidth = image.size.width  ;
    // ratio = 0.5 ;
    //  float maxRatio = 320.0/480.0;  // Co anh theo ty le
    
    //    if(imageRatio!=maxRatio){
    //        if(imageRatio < maxRatio){
    //            imageRatio = 480.0 / actulHeght;
    //            actulWidth = imageRatio * actulWidth;
    //            actulHeght = 480.0;
    //        }
    //        else{
    //            imageRatio = 320.0 / actulWidth;
    //            actulHeght = imageRatio * actulHeght;
    //            actulWidth = 320.0;
    //        }
    //    }
    CGRect rect = CGRectMake(0, 0, actulWidth*ratio, actulHeght*ratio);
    CGImageRef imageRef = image.CGImage;
    //UIGraphicsBeginImageContext(rect.size);
  //  [image drawInRect:rect];
   // UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContextWithOptions(rect.size, YES,0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, rect.size.height);
    CGContextConcatCTM(context, flipVertical);
    // Draw into the context; this scales the image
    CGContextDrawImage(context, rect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    UIImage *img = [UIImage imageWithCGImage:newImageRef];
    CGImageRelease(newImageRef);
    UIGraphicsEndImageContext();
    return img;
    
}
- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize {
    
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    
    NSLog(@"%f %f",newSize.width,newSize.height);
    
    CGImageRef imageRef = image.CGImage;
    
    
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    // Set the quality level to use when rescaling
    
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height);
    
    
    
    CGContextConcatCTM(context, flipVertical);
    
    // Draw into the context; this scales the image
    
    CGContextDrawImage(context, newRect, imageRef);
    
    
    
    // Get the resized image from the context and a UIImage
    
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    
    
    CGImageRelease(newImageRef);
    
    UIGraphicsEndImageContext();
    
    NSLog(@"%f",newImage.size.width);
    
    return newImage;
    
}


@end
