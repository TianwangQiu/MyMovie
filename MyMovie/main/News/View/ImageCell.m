

#import "ImageCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCell


- (id)initWithFrame:(CGRect)frame{
    
    //  W H  X  Y
    
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return  self;
    
}
- (void)_createSubView{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    _imageView.layer.cornerRadius = 20;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    
    
    
    [self.contentView addSubview:_imageView];
    

}

- (void)setModal:(ImageModal *)modal{
    
    _modal = modal;
    [self setNeedsLayout];
    
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
    

    
}



@end
