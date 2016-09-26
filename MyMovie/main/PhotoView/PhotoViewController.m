

#import "PhotoViewController.h"

#define  kWidth [UIScreen mainScreen].bounds.size.width
#define  kHeight [UIScreen mainScreen].bounds.size.height




@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createNavigation];
    [self _createColletionView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideNav) name:@"HideNavigationBarNotification" object:nil];
    
    
    
    
}

- (void)hideNav{
    
    NSLog(@"隐藏导航栏");
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    
   [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
    
}



//提倡 为控制器 瘦身
- (void)_createColletionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.view.bounds.size;
    //设置滑动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //以下事情不要让vc去做
//    _collectionView.dataSource = self;
//    _collectionView.delegate = self;
    
    layout.minimumLineSpacing = 30;
   // layout.minimumInteritemSpacing = 30;
    _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth+30, kHeight) collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
        
    _collectionView.imageUrlArray = _imageUrlArray;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.currentIndex inSection:0];
    
    
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    

    
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray{
    
    _imageUrlArray = imageUrlArray;
    
    _collectionView.imageUrlArray = _imageUrlArray;
    
}



- (void)_createNavigation{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    
}

- (void)cancelAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
