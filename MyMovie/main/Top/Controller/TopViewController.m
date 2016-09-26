

#import "TopViewController.h"
#import "common.h"
#import "DataService.h"
#import "MovieModal.h"
#import "TopMovieCell.h"
#import "MovieDetailController.h"

static NSString *cellId = @"TopMovieCell";

@implementation TopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Top250";
    }
    return  self;
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self _createCollectionView];
    [self _initData];
    [self _loadData];
    
    
    
}

- (void)_createCollectionView{
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake((kWidth-40)/3,(kWidth-40)/3*1.5 );
    
    
    
    
    //创建_collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    

    UINib *nib = [UINib nibWithNibName:@"TopMovieCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:cellId];
    
    [self.view addSubview:_collectionView];
    
    
    
    
}

- (void)_initData{
    
    _movieModalArray = [[NSMutableArray alloc] init];
    
}

- (void)_loadData{

    NSString *url=@"/v2/movie/top250";
    
     [DataService getJsonDataFromUrl:url block:^(id result) {
         NSDictionary *jsonDic =result;
         NSArray *subjects = [jsonDic objectForKey:@"subjects"];
         
         for (NSDictionary *dic in subjects) {
             
             MovieModal *modal = [[MovieModal alloc] init];
             [modal setValuesForKeysWithDictionary:dic];
             
             [_movieModalArray addObject:modal];
         }
         dispatch_async(dispatch_get_main_queue(), ^{
             [_collectionView reloadData];
             [_collectionView setNeedsLayout];
         });
        
     }];
    
 

}

#pragma mark - CollectionView Delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _movieModalArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    TopMovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    
    cell.modal = _movieModalArray[indexPath.row];
    
    return  cell;

    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    
}

//单元格点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.navigationController pushViewController:[[MovieDetailController alloc] init] animated:YES];
    
}




@end
