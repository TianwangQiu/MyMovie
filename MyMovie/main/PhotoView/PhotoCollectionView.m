

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"


@implementation PhotoCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        //注册单元格
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }

    return  self;
    
}
- (void)setImageUrlArray:(NSArray *)imageUrlArray{
    
    _imageUrlArray = imageUrlArray;
    //如果数据变化了，需要重新刷新数据
    [self reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _imageUrlArray.count;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageUrlStr = _imageUrlArray[indexPath.row];

    return  cell;
    
    
}
//当cell消失的时候 执行的方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //01 拿到cell
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell*)cell;
    
    //02 cell  --> scrollView 放大倍数设置为1
    
    PhotoScrollView*scrollView = (PhotoScrollView *)[photoCell.contentView viewWithTag:100];
    
    scrollView.zoomScale = 1.0;
    
    
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return  UIEdgeInsetsMake(0, 0, 0, 30);
    
}










@end
