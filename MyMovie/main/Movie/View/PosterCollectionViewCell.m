

#import "PosterCollectionViewCell.h"
#import "common.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
@implementation PosterCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    
    
    }
    return  self;
}


- (void)_createSubViews{

    CGFloat imageWidth = self.width*0.9;
    CGFloat imageHeight = self.height *0.9;
    //从xib 创建对象
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"PosterDetailView" owner:self options:nil];
    _detailView = [views lastObject];
    _detailView.hidden = YES;
    _detailView.frame = CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth , imageHeight);
    [self.contentView addSubview:_detailView];
    

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth , imageHeight)];
    
    [self.contentView addSubview:_imageView];


}

- (void)setModal:(MovieModal *)modal{
    
    _modal = modal;
    _detailView.modal = modal;
    
    [self setNeedsLayout];

}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (_isBack) {
        _detailView.hidden = NO;
        _imageView.hidden = YES;
    }else{
        _detailView.hidden = YES;
        _imageView.hidden = NO;
    }

    NSString *str = [_modal.images objectForKey:@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    
}


- (void)flipCell{
    
    [self _flipView:self isLeft:_imageView.hidden];
    _imageView.hidden = !_imageView.hidden;
    _detailView.hidden = !_detailView.hidden;
    
}

- (void)_flipView:(UIView *)view isLeft:(BOOL)isLeft{
    UIViewAnimationOptions option = isLeft?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:.3 options:option animations:nil completion:nil];
}





@end
