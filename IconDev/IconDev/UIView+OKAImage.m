//
// Created by Khiyuan Fan on 2017/8/30.
// Copyright (c) 2017 OKA_APP. All rights reserved.
//

#import "UIView+OKAImage.h"

@implementation UIView (OKAImage)

-(void)oka_saveSnapImageWithFinishSelector:(SEL)finishSelector{
    dispatch_async(dispatch_get_main_queue(), ^{

        UIGraphicsBeginImageContextWithOptions(self.bounds.size,YES,self.layer.contentsScale);

        [self drawViewHierarchyInRect:self.bounds
                   afterScreenUpdates:YES];

        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(image, self, finishSelector, NULL);
    });
}

-(UIImage *)oka_snapImage{
    __block UIImage *image;
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size,YES,self.layer.contentsScale);
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    });
    return image;
}


- (UIImage *)oka_blurSnapImage{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:[self oka_snapImage].CGImage];

    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@15.0f forKey:@"inputRadius"];//其中数值是模糊度（3～30，越大越模糊）
    CIImage *result = [filter valueForKey:kCIOutputImageKey];

    CGImageRef cgImage = [context createCGImage:result fromRect:inputImage.extent];

    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return returnImage;
}
@end
