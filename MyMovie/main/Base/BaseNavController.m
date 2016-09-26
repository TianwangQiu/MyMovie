

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //01 修改style的时候 会影响 状态栏颜色
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    //02 设置导航栏背景图片,会影响透明度
    //self.navigationBar.translucent
    
    NSLog(@"%d",self.navigationBar.translucent);
   [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = YES;
  NSLog(@"%d",self.navigationBar.translucent);
    NSLog(@"%d",self.navigationBar.translucent);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ios 7用以下方法设置 状态栏的样式,多层关系种，nav的子控制器里面重写该方法无效

- (UIStatusBarStyle)preferredStatusBarStyle{
    NSLog(@"preferredStatusBarStyle");
    
    //调用在最上层的子控制器 的preferredStatusBarStyle,来定制不同 子控制器的状态栏
    //return [self.topViewController preferredStatusBarStyle];

   return  UIStatusBarStyleLightContent;
}


//- (BOOL)prefersStatusBarHidden{
//    
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
