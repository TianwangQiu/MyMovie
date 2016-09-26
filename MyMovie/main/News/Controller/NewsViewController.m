

#import "NewsViewController.h"

#import "NewsCell.h"
#import "DataService.h"
#import "NewsModal.h"
#import "common.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "NewsDetailViewController.h"
#import "NewImageListViewController.h"

static NSString *newsCellId = @"newsCellId";



@interface NewsViewController (){
    UIImageView *_headerImageView;
    UILabel *_headerLable;
    

}

@end

@implementation NewsViewController



#pragma mark -  ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"新闻";
    }
    return  self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self _createTable];
    [self _createHeaderView];
    
    [self _loadData];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createSubViews



- (void)_createTable{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:newsCellId];
    
}




#pragma mark - loadData
- (void)_loadData{
    
    _newsModalArray  = [[NSMutableArray alloc] init];
    NSArray *newsArray = [DataService getJsonDataFromFile:NewsListFile];

    for (NSDictionary *dic in newsArray) {
        NewsModal *modal = [[NewsModal alloc]init];
        
        [modal setValuesForKeysWithDictionary:dic];
        [_newsModalArray addObject:modal];
    }
    //头条新闻
    NewsModal *modal = _newsModalArray[0];
    _headerLable.text = modal.title;
    
    NSURL *url = [NSURL URLWithString:modal.image];
    [_headerImageView sd_setImageWithURL:url];
    //把数组中第一个数据删除，保持tableCell 和 数组一一对应
    [_newsModalArray removeObjectAtIndex:0];
    

}


#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _newsModalArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:newsCellId forIndexPath:indexPath];
    cell.news = _newsModalArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModal *modal = _newsModalArray[indexPath.row];
    if (modal.type == 0) {
        NewsDetailViewController *vc  = [[NewsDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
    
    }else{
    
    
    
        NewImageListViewController *vc = [[NewImageListViewController alloc] init];
    
    
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
    
    
}



//01 向下拉动  图片放大实现方法一
//- (void)_createHeaderView{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    headerView.backgroundColor = [UIColor clearColor];
//    _tableView.tableHeaderView = headerView;
//
//
//
//    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavHeight, kWidth, 200)];
//    _headerLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWidth, 30)];
//
//    //UIViewExt 类目 下边沿对齐，其实还是修改y坐标
//    _headerLable.bottom = _headerImageView.bottom;
//
//    _headerLable.backgroundColor = [UIColor grayColor];
//    _headerLable.textColor = [UIColor whiteColor];
//
//
//    [self.view addSubview:_headerImageView];
//    [self.view addSubview:_headerLable];
//
//
//}

//监控table的滑动
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    CGFloat offY  = scrollView.contentOffset.y;
//    
//    NSLog(@"%f",offY);
//    
//    if (offY > -64) {//向上滑动
//        
//        _headerImageView.top = -offY;
//        _headerLable.bottom = _headerImageView.bottom;
//        
//        
//    }else{//向下滑动
//        
//        CGFloat newHeight = ABS(offY)-64+200;
//        CGFloat newWidth = kWidth/200 *newHeight;
//        
//        _headerImageView.frame = CGRectMake((kWidth-newWidth)/2, 64, newWidth, newHeight);
//        _headerLable.bottom = _headerImageView.bottom;
//
//
//    }
//    
//}

//方法二

- (void)_createHeaderView
{
    
  
    //01 头部标题
    _headerLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, kWidth, 40)];
    [_headerLable setTextAlignment:NSTextAlignmentCenter];
    _headerLable.font = [UIFont systemFontOfSize:18];
    _headerLable.textColor = [UIColor whiteColor];
    
    //自动布局，自适应顶部，顶部空间是变动的，底部对齐父视图
    _headerLable.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    
    //02 头部图片
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, kWidth, 200)];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;//自适应宽高比
    [_headerImageView addSubview:_headerLable];
    [_tableView addSubview:_headerImageView];

   
    //设置 _tableViewContenInset ,scrollView的内容边界, automaticallyAdjustsScrollViewInsets在此基础上再增加64
    //其实是 264
      _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    NSLog(@"%f",y);
    if (y < -264) {//向下
        CGFloat distance = ABS(y)-264; //向下拉动距离
        _headerImageView.top = -200-distance;
        _headerImageView.height = 200+distance;
        
    }
    
}




@end
