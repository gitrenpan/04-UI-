//
//  DSNewFeatureController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSNewFeatureController.h"

@interface DSNewFeatureController ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation DSNewFeatureController

- (UIScrollView *)scrollView
{
    if(_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    for(int i = 0; i < 3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * KScreenWidth, 0, KScreenWidth, KScreenHeight)];
        
        NSString *imageName = [NSString stringWithFormat:@"guide_%d",i];
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.scrollView addSubview:imageView];
        
        if(i == 2){
        
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeRootViewController)];
            
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:tapGesture];
        
        }
    }

    self.scrollView.contentSize = CGSizeMake(3*KScreenWidth, KScreenHeight);
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    [self.view addSubview:self.scrollView];
}


- (void)changeRootViewController{
    
    UIWindow *window = self.view.window;
    
    window.rootViewController = [[DSBaseTabBarController alloc] init];
    
    [window makeKeyAndVisible];

}

@end
