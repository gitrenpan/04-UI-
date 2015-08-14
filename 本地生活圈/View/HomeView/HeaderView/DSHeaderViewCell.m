//
//  DSHeaderViewCell.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/12.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSHeaderViewCell.h"
#import "iCarousel.h"
#import "UIImageView+WebCache.h"


@interface DSHeaderViewCell () <iCarouselDelegate,iCarouselDataSource>

@property (weak, nonatomic) IBOutlet iCarousel *carouselView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;


@end

@implementation DSHeaderViewCell

// 返回一个Cell
+ (instancetype)headerViewCell
{
    DSHeaderViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DSHeaderViewCell" owner:nil options:nil] lastObject];

    return cell;
}


- (void)awakeFromNib {

    // 初始化carouselView
    _carouselView.dataSource = self;
    _carouselView.delegate = self;
    _carouselView.pagingEnabled = YES;
    _carouselView.type = iCarouselTypeLinear;


}

#pragma mark - 重写模型的set方法
- (void)setFoucsModel:(FocusListModel *)foucsModel
{
    _foucsModel = foucsModel;

    // 根据模型属性设置子控件的属性
    FocusModel *listModel = foucsModel.list[0];
    
    self.titleLabel.text = listModel.title;
    
    // 设置分页指示器
    self.pageControl.numberOfPages = foucsModel.list.count;
    
    self.pageControl.currentPage = 0;
    
    // 重新加载数据
    [self.carouselView reloadData];
    
    // 开启定时器
    [self timerStart];
    
}


#pragma mark - 定时器方法
- (void)timerStart{
    
    _timer = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(autoCircle) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}

- (void)autoCircle{
    
    [UIView animateWithDuration:1.0 animations:^{
        
        _carouselView.currentItemIndex = (_carouselView.currentItemIndex + 1) % _foucsModel.list.count;

    }];
    
}

#pragma mark - iCarouselDataSource数据源方法

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.foucsModel.list.count;
}


- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    // 获得模型
    FocusModel *listModel = self.foucsModel.list[index];
    
    
    if(view == nil){
    
        view = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [(UIImageView *)view sd_setImageWithURL:[NSURL URLWithString:listModel.cover]];
    }
    
    return view;
}


#pragma mark - iCarouselDelegate代理方法

- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
    if(self.timer.valid){
        
        [self.timer invalidate];
    
        self.timer = nil;
    }
}


- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    if(self.timer == nil){
    
        [self timerStart];
    
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(__unused UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{

}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    FocusModel *listModel = self.foucsModel.list[self.carouselView.currentItemIndex];
    
    _pageControl.currentPage = self.carouselView.currentItemIndex;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.titleLabel.text = listModel.title;
    });
    
    
   
}


- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carouselView.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}


@end
