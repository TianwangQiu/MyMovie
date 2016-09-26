

#import <UIKit/UIKit.h>

@interface PosterColletionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,retain)NSArray *movieModalArray;//数据
@property (nonatomic,assign)NSInteger currentIndex;//记录 中间cell 的索引
@property (nonatomic,assign)CGFloat itemWidth;

@end
