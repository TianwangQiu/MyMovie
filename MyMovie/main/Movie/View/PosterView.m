

#import "PosterView.h"
#import "UIViewExt.h"
#import "common.h"

#define kHeaderViewH 136 //头部视图高度
#define kIndexCollectionViewH 100 //小海报高度
#define kBottomTitleLableH 35 //底部标题栏高度
#define kBottomTitleLableY (kHeight-kTabBarHeight-kBottomTitleLableH) //底部标题栏Y坐标
#define kHeaderOffH   36 //头部视图向上偏移距离
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH) //大海报Y
#define kPosterColletionViewH  (kHeight-kPosterColletionViewY-kTabBarHeight-kBottomTitleLableH) //大海报高度


@implementation PosterView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createPosterCollectionView];
        [self _createBottomTitleLable];

        [self _createCoverView];
        
        [self _createHeaderView];
        [self _createGesture];
        
        //增加观察者
        [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_posterColletionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        

        
        
    }
    return self;

    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSNumber *number = [change objectForKey:@"new"];
    
    NSInteger index = [number integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    //小海报动了
    if ([object isKindOfClass:[IndexCollectionView class]] && _posterColletionView.currentIndex != index) {
        
        [_posterColletionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _posterColletionView.currentIndex = index;
        
        
    }else if([object isKindOfClass:[PosterColletionView class]] && _indexCollectionView.currentIndex!= index){
        
        [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _indexCollectionView.currentIndex = index;
    }
    //更新 标题
    MovieModal *modal = _movieModalArray[index];
    _bottomTitleLable.text = modal.title;
}





#pragma mark - subViews

//创建头部视图
- (void)_createHeaderView{
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderOffH, kWidth, kHeaderViewH)];
    _headerView.backgroundColor = [UIColor clearColor];
   // _headerView.backgroundColor = [UIColor greenColor];
    
    //01 背景视图
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    bgImageView.image = image;
    [_headerView addSubview:bgImageView];
    

    
    //02  小海报视图
//     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH)];
//    indexView.backgroundColor = [UIColor redColor];
//    [_headerView addSubview:indexView];
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    _indexCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH) collectionViewLayout:layout];
    
    _indexCollectionView.itemWidth = kWidth/5;
  //  _indexCollectionView.backgroundColor = [UIColor greenColor];
    
    [_headerView addSubview:_indexCollectionView];
    
    
    
    //03 按钮视图
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kWidth-20)/2, kHeaderViewH-25, 20, 20)];
   // button.backgroundColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    button.tag = 100;
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headerView addSubview:button];
    
    
    
    [self addSubview:_headerView];
    
}


//创建大海报视图
- (void)_createPosterCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //layout.itemSize
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //间距 
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    

    
    _posterColletionView = [[PosterColletionView alloc] initWithFrame:CGRectMake(0, kPosterColletionViewY, kWidth, kPosterColletionViewH) collectionViewLayout:layout];
    _posterColletionView.itemWidth = kWidth*3/4;
    
  //  _posterColletionView.backgroundColor = [UIColor blueColor];
    
    [self addSubview:_posterColletionView];
    
}

//创建底部标题视图
- (void)_createBottomTitleLable{
    
    
    _bottomTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, kBottomTitleLableY, kWidth, kBottomTitleLableH)];
    
    _bottomTitleLable.textColor = [UIColor whiteColor];
    _bottomTitleLable.textAlignment = NSTextAlignmentCenter;
    
    
    _bottomTitleLable.backgroundColor = [UIColor clearColor];
    
    MovieModal *modal = _movieModalArray[0];
    _bottomTitleLable.text = modal.title;
    [self addSubview:_bottomTitleLable];
}


- (void)_createCoverView{
    
    
    _coverView = [[UIControl alloc]initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.6];
    _coverView.hidden = YES;
    
    [_coverView addTarget:self action:@selector(coverTapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coverView];
    
    
    
}

//创建清扫手势
- (void)_createGesture{
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownAction)];
    //设置清扫方向
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipeDown];

    
}



#pragma mark - Action

- (void)swipeDownAction{
    
    NSLog(@"清扫 ");
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    
    [self showHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];

}


- (void)coverTapAction:(UIControl *)control{
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    
    [self hideHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];



}
- (void)pullAction:(UIButton *)button{
    
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    if (button.selected == NO) {
        [self showHeader];
    }else{
        [self hideHeader];
    }
    button.selected = !button.selected;
    
    [UIView commitAnimations];
}


- (void)showHeader{
    
    _headerView.top = kNavHeight;
    _coverView.hidden = NO;

    
}

- (void)hideHeader{
    
    _headerView.top = -kHeaderOffH;
    _coverView.hidden = YES;

    
}
- (void)setMovieModalArray:(NSArray *)movieModalArray{
    
    _movieModalArray = movieModalArray;
    _posterColletionView.movieModalArray = movieModalArray;
    _indexCollectionView.movieModalArray = movieModalArray;
    //更新 标题
    MovieModal *modal = _movieModalArray[0];
    _bottomTitleLable.text = modal.title;
    
    
}



@end
