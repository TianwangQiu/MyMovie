

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>{
    UICollectionView *_collectionView;
    NSMutableArray *_movieModalArray;
    
}




@end
