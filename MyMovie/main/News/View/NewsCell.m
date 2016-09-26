

#import "NewsCell.h"


@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setNews:(NewsModal *)news{
    _news = news;
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _titleLable.text = _news.title;
    _summryLable.text = _news.summary;
    
    
    if (_news.type == 0) {
        _typeImage.hidden = YES;
    }else if(_news.type == 1){
        _typeImage.hidden = NO;
        _typeImage.image = [UIImage imageNamed:@"sctpxw.png"];
        
    }else{
        _typeImage.hidden = NO;
        _typeImage.image = [UIImage imageNamed:@"scspxw.png"];
    }
    NSURL *url = [NSURL URLWithString:_news.image];

    [_newsImage sd_setImageWithURL:url];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
