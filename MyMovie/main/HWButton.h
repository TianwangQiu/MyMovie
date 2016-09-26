

#import <UIKit/UIKit.h>

@interface HWButton : UIControl{
    UIImageView  *_imgView;
    UILabel *_lable;
}

- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName  withTitle:(NSString *)title;





@end
