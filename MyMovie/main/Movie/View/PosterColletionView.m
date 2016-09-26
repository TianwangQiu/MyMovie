

#import "PosterColletionView.h"
#import "PosterCollectionViewCell.h"
#import "UIViewExt.h"
#import "common.h"
#import "MovieModal.h"

@implementation PosterColletionView


- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {

        self.dataSource = self;
        self.delegate = self;
       // self.pagingEnabled = YES;
    

        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        
    }
    return self;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.movieModalArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    MovieModal *modal = _movieModalArray[indexPath.row];
    cell.isBack = NO;
    cell.modal = modal;
    
    return  cell;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //CGFloat cellWidth = kWidth*3/4;
    
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
    CGFloat itemWith = self.itemWidth;
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //01 如果是中间的则翻页
    if(indexPath.row == self.currentIndex){
        PosterCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];

        [cell flipCell];
    }else{    //02 如果不是 则 滑动到中间

        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
        
    }
    
}








@end
