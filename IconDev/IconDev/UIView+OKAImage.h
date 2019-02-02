//
// Created by Khiyuan Fan on 2017/8/30.
// Copyright (c) 2017 OKA_APP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (OKAImage)
/*
 *@param finishSelector： @selector(image:didFinishSavingWithError:contextInfo:)
 */
-(void)oka_saveSnapImageWithFinishSelector:(SEL)finishSelector;

/** 获取View 截图 */
@property (nonatomic, readonly, strong) UIImage *oka_snapImage;

@property (nonatomic, readonly, strong) UIImage *oka_blurSnapImage;

@end
