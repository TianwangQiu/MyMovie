
#import "CinemaCell.h"
#import "UIViewExt.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _cinemaName.text = _model.name;
    [_cinemaName sizeToFit];
    
    _cinameRating.text = _model.grade;
    _cinameRating.left = _cinemaName.right + 5;
    
    _cinemaAddress.text = _model.address;
    
    _lowerPrice.text = [NSString stringWithFormat:@"￥%@",_model.lowPrice];
    if ([_model.lowPrice isEqualToString:@""]) {
        
        _lowerPrice.text = @"";
    }
    
    if ([_model.isSeatSupport integerValue] == 1) {
        z_image.hidden = NO;
    } else {
        z_image.hidden = YES;
    }
    
    if ([_model.isCouponSupport integerValue] == 1) {
        q_image.hidden = NO;
    } else {
        q_image.hidden = YES;
    }
    
}

@end
