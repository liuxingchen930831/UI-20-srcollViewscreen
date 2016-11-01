//
//  ViewController.m
//  滚动引导页
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *sunView;
@property (weak, nonatomic) IBOutlet UIImageView *personView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"520_userguid_bg"];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    scrollView.contentSize = image.size;
    scrollView.delegate = self;
    //设置scrollView的惯性效果
    scrollView.decelerationRate = 0.5;
    //把scrollView插入到什么位置
    [self.view insertSubview:scrollView atIndex:0];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    //设置scrollView图片全屏
    CGRect rect = imageView.frame;
    rect.size.height = self.view.bounds.size.height;
    imageView.frame = rect;
    [scrollView addSubview:imageView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取scrollView的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    int intoffsetX = (int)offsetX;
    //设置人物滚动的图片
    NSString *imageName = [NSString stringWithFormat:@"520_userguid_person_taitou_%d",(intoffsetX % 2 +1)];
    self.personView.image = [UIImage imageNamed:imageName];
    
    self.sunView.transform = CGAffineTransformRotate(self.sunView.transform, (5)/ M_PI * 180);
}
@end
