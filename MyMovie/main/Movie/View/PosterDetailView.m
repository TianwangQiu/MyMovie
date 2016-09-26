

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"

@implementation PosterDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setModal:(MovieModal *)modal{
    _modal = modal;
    [self setNeedsLayout];

}

- (void)layoutSubviews{
    NSString *imageStr = [_modal.images objectForKey:@"medium"];

    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    
    _titleLable.text = _modal.title;
    _yearLable.text = _modal.year;
    _englishTitleLable.text = _modal.title;
    _averageLable.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    
    _starView.average = _modal.average;
    
}



@end
