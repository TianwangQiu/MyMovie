
#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>{
    UIImageView *_imageView;
    
}
@property (nonatomic,copy) NSString *imageUrlStr;

@end
