

#import "MainTabBarController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "HWButton.h"
#import "BaseViewController.h"
#import "BaseNavController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)_createViewControllers{
    
    //第三层
    MovieViewController *vc1 = [[MovieViewController alloc] init];
    NewsViewController *vc2 = [[NewsViewController alloc] init];
    TopViewController *vc3= [[TopViewController alloc] init];
    CinemaViewController *vc4 = [[CinemaViewController alloc] init];
    MoreViewController *vc5 = [[MoreViewController alloc] init];
    
    NSArray *vcArray = @[vc1,vc2,vc3,vc4,vc5];
    
    //第二层
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<5; i++) {
    
       BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:vcArray[i]];
    
        [navArray addObject:nav];
    
    }
    //第二层的导航控制器交给 标签控制器管理
    self.viewControllers = navArray;
    

}

- (void)_setTabBar{
    //01 移除tabBar 的子视图
    for (UIView *subView in self.tabBar.subviews) {
        
//        NSStringFromClass(<#__unsafe_unretained Class aClass#>)
//        NSClassFromString(<#NSString *aClassName#>)
        
        //判断一下 更严谨，移除tabBar里面子视图
        Class cls = NSClassFromString(@"UITabBarButton");
        
        //UITabBarItem ---> modal 记录了数据
        //数据交给 UITabBarButton 显示
        if ([subView isKindOfClass:cls]) {
            [subView removeFromSuperview];
        }

  
    }
    //02 设置背景
      NSLog(@"%d",self.tabBar.translucent);
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    self.tabBar.translucent = YES;
    
    //03 增加子视图
    NSArray *imageName = @[@"movie_home.png",@"msg_select_new.png",@"start_top250.png",@"icon_cinema.png",@"more_setting.png"];
    
    NSArray *titles = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    CGFloat width = CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    
//    for (int i = 0; i<5; i++) {
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        
//        [button setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
//        
//        button.titleLabel.font = [UIFont systemFontOfSize:11];
//        //调整image title 位置
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, -18, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
//
//        [self.tabBar addSubview:button];
//    }
    //阴影
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:_selectedImageView];
    
    //按钮
    for (int i = 0; i<5; i++) {
        CGRect frame = CGRectMake(i*width, 0, width, height);
        HWButton *button = [[HWButton alloc] initWithFrame:frame withImageName:imageName[i] withTitle:titles[i]];
        button.tag = i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
    }
    
}
- (void)btnAction:(HWButton *)button{
    NSInteger index = button.tag;
    self.selectedIndex = index;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    _selectedImageView.center = button.center;
    
    [UIView commitAnimations];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViewControllers];
    [self _setTabBar];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
