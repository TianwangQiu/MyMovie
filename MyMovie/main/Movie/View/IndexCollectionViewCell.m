

#import "IndexCollectionViewCell.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

@implementation IndexCollectionViewCell




- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    
        CGFloat width = self.width * .9;
        CGFloat height = self.height * .9;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - width) / 2, (self.height - height) / 2, width, height)];
        
        [self.contentView addSubview:_imageView];
    }
    return  self;
    
}


- (void)setModal:(MovieModal *)modal{
    _modal = modal;
    [self setNeedsLayout];
    
    
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    NSString *str = [_modal.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:str];
    
    [_imageView sd_setImageWithURL:url];
    
    [super layoutSubviews];
    
    
}


@end
