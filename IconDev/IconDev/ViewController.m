//
//  ViewController.m
//  IconDev
//
//  Created by ZhuHong on 2018/11/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ViewController.h"
#import "UIView+OKAImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.label.text = @"";
    // self.label.text = @"朱             鸿             专             用";
    self.label.text = @"C      o      d      e      r      H      G";
    self.label.text = @"CoderHG";
}

- (void)viewDidAppear1:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.iconView.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor grayColor];
    self.iconView.layer.cornerRadius = self.iconView.frame.size.width*0.5;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImage* oka_snapImage = self.iconView.oka_snapImage;
    NSData *imagedata = UIImageJPEGRepresentation(oka_snapImage,1.0);
    
    [imagedata writeToFile:@"/Users/zhuhong/Desktop/icon/icon_OK.jpeg" atomically:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
