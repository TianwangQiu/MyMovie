

#import "NewImageListViewController.h"
#import "common.h"
#import "ImageCell.h"
#import "DataService.h"
#import "BaseNavController.h"
#import "PhotoViewController.h"

@implementation NewImageListViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self _createCollectionView];
    [self _loadData];
    
    
    
}


- (void)_createCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize =  CGSizeMake((kWidth-50)/4, (kWidth-50)/4);
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //注册单元格
    
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
    
}
- (void)_loadData{
    
    _imageModalArray = [[NSMutableArray alloc] init];
    
NSArray *jsonArray = [DataService getJsonDataFromFile:ImageListFile];
  //  NSArray *jsonArray = [DataService getJsonDataFromUrl:@"/v2/movie/us_box"];
    for (NSDictionary *dic in jsonArray) {
        
        
        ImageModal *modal = [[ImageModal alloc] init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_imageModalArray addObject:modal];
        
        
    }
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _imageModalArray.count;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.modal = _imageModalArray[indexPath.row];
    return cell;
    
}


//功能抽离
//代码不要耦合

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    //当前点击的索引是多少
    vc.currentIndex = indexPath.row;
    
    
    //抽离URL,不要耦合
    NSMutableArray *imageUrlArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<_imageModalArray.count; i++) {
        ImageModal *modal = _imageModalArray[i];
        NSString *urlStr = modal.image;
        [imageUrlArray addObject:urlStr];
        
    }
    
    vc.imageUrlArray = imageUrlArray;

    
    vc.view.backgroundColor = [UIColor clearColor];

    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
    

    
}






@end
