

#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"


@implementation MovieCell

//这个方法是 alloc创建对象的时候调用的
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
  
    }
    return  self;
    
}

//如果是从xib文件直接创建出来的对象 ，则调用awakeFromNib

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setModal:(MovieModal *)modal{
    
    _modal = modal;
    _starView.average = modal.average;
    
    [self setNeedsLayout];
    
   
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    CGFloat width = _averageLable.frame.size.width;
//    CGFloat height = _averageLable.frame.size.height;
//    CGFloat y = CGRectGetMinY(_averageLable.frame);
//    
//    _averageLable.frame = CGRectMake(kWidth-width-10, y, width, height);
//    
//    
//    
    
    _titleLable.text = _modal.title;
    _yearLable.text = [NSString stringWithFormat:@"年份:%@",_modal.year];
    
    _averageLable.text =  [NSString stringWithFormat:@"%.1f",_modal.average];
    
    //http://img3.douban.com/view/photo/thumb/public/p1943399384.jpg
    NSString *imageStr = [_modal.images objectForKey:@"medium"];
    
    //开源框架 sdWebImage gitHUb 
    
   // [_iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"msg_new"]];
    //_iconImageView.contentMode = UIViewContentModeScaleToFill;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
