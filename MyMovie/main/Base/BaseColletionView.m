

#import "BaseColletionView.h"
#import "UIViewExt.h"
#import "common.h"



@implementation BaseColletionView


- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        //不注册单元格，子类注册
        // self.pagingEnabled = YES;
        
    }
    return self;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.movieModalArray.count;
}


//不需要 ，由子类实现
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    

    return UIEdgeInsetsMake(0, (kWidth-self.itemWidth)/2, 0, (kWidth-self.itemWidth)/2);
    
}


- (void)setMovieModalArray:(NSArray *)movieModalArray{
    
    _movieModalArray = movieModalArray;
    
    [self reloadData];
    
}


//设置每个cell的size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, self.height);
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    //targetContentOffset 目标偏移量
    //targetContentOffset->x
    
    //调整 目标偏移
    CGFloat itemWith =  self.itemWidth;
    CGFloat x = targetContentOffset->x;
    NSInteger index = x/itemWith;// 5    x= 6      index  1
    //安全处理
    if (index < 0) {
        index = 0;
    }else if (index>= _movieModalArray.count){
        
        index = _movieModalArray.count-1;
    }
    
    
    targetContentOffset->x = itemWith * index;  // 0
    
    self.currentIndex = index;
    
    
    
}
//由子类实现 

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row != self.currentIndex) {
//        
//        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        self.currentIndex = indexPath.row;
//        
//    }
//    
//}




@end
