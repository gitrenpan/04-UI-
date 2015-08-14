//
//  DSGroupCollectionViewCell.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/13.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSGroupCollectionViewCell.h"

@interface DSGroupCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DSGroupCollectionViewCell

- (void)awakeFromNib {
    
    
    
}

+ (instancetype)groupCollectionViewCell
{
    DSGroupCollectionViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DSGroupCollectionViewCell" owner:nil options:nil] lastObject];

    return cell;
}

- (void)setGroupModel:(DSGroupModel *)groupModel
{
    _groupModel = groupModel;

//    [self.iconView sd_setImageWithURL:[NSURL URLWithString:groupModel.cover]];
    
    self.iconView.image = [UIImage imageNamed:@"1"];
    
    self.nameLabel.text = groupModel.title;
    
}

@end



















