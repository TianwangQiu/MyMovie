

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
@interface PhotoCollectionViewCell : UICollectionViewCell{
    PhotoScrollView *_scrollView;
}
@property (nonatomic,copy)NSString* imageUrlStr;


@end
