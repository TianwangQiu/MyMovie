
#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"

@interface PhotoViewController : UIViewController{
    PhotoCollectionView  *_collectionView;
}
@property (nonatomic,retain)NSArray *imageUrlArray;
@property (nonatomic,assign)NSInteger currentIndex;//当前点击的图片的索引

@end
