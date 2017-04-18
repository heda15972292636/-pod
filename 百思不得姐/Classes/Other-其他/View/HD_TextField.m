//
//  HD_TextField.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/15.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TextField.h"
static NSString *const HDPlaceholderColorkey = @"placeholderLabel.textColor";
@implementation HD_TextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    self.tintColor = [UIColor whiteColor];
   // self.textColor = [UIColor whiteColor];
    
 //   NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  //  dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
 //   self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:dict];
    [self setValue:[UIColor grayColor] forKeyPath:HDPlaceholderColorkey];
    
    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    [self addTarget:self action:@selector(EditingChanged) forControlEvents:UIControlEventEditingChanged];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];

          [super awakeFromNib];
}
-(void)editingDidBegin
{
    [self setValue:[UIColor whiteColor] forKeyPath:HDPlaceholderColorkey];
}

-(void)editingDidEnd
{
    [self setValue:[UIColor grayColor] forKeyPath:HDPlaceholderColorkey];
 
    NSLog(@"%s",__func__);
}

-(void)EditingChanged{
    
    NSLog(@"%s",__func__);
}
//assigan  不是强引用   ，不能保住对象的命    如果引用的oc对象被销毁了  ，指针依然不能清空    会报野指针错误(EXC_BAD_ACCESS)


//weak  不是强引用，不能保住oc对象的命
//如果引用的oc对象销毁了  指针会被自动清空
//不在指向销毁的对象

////
   //assign  -一般用在基本数据类型上面 比如int/double等

   //weak  一般用在代理对象上面，或者用来解决循环强引用的问题

-(void)beginEditing{
    NSLog(@"%s",__func__);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
