

#import "BaseViewController.h"

@interface NewImageListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    UICollectionView *_collectionView;
    NSMutableArray *_imageModalArray;
    
    
}

@end
