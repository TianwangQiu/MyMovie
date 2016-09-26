

#import "HWButton.h"

@implementation HWButton


- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName  withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        //01 创建imgView
        _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        // 内容显示模式  等比例
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        //
        _imgView.image = [UIImage imageNamed:imageName];
        [self addSubview:_imgView];
        
        
        
        //02 创建Lable
        _lable = [[UILabel alloc] initWithFrame:CGRectZero];
        _lable.text = title;
        _lable.font = [UIFont systemFontOfSize:11];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.textColor = [UIColor whiteColor];
        
        [self addSubview:_lable];
    
    }
    return  self;
    
    
}

//在 layoutSubviews 布局子视图
- (void)layoutSubviews{
    
    [super layoutSubviews];
    _imgView.frame = CGRectMake((self.frame.size.width-20)/2, 5, 20, 20);
    _lable.frame = CGRectMake(0, CGRectGetMaxY(_imgView.frame), CGRectGetWidth(self.frame), 20);
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
