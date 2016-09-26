

#import "TopMovieCell.h"
#import "UIImageView+WebCache.h"

@implementation TopMovieCell

- (void)awakeFromNib {
}

- (void)setModal:(MovieModal *)modal{
    
    _modal = modal;
    [self setNeedsLayout];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    NSString *str = [_modal.images objectForKey:@"medium"];

    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    _starView.average = _modal.average;
    
    _titleLable.text = _modal.title;
    _averageLable.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    
    
    
    
}






@end
