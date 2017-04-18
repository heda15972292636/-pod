//
//  HD_MeCell.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/15.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_MeCell.h"

@implementation HD_MeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    self.imageView.HD_y = HD_smallMargin;
    self.imageView.HD_heigh = self.contentView.HD_heigh - 2 *HD_smallMargin;
    self.imageView.HD_width = self.imageView.HD_heigh;
    
    
    self.textLabel.HD_x = self.imageView.HD_right + HD_Margin;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
