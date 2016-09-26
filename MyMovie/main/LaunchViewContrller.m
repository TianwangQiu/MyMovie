

#import "LaunchViewContrller.h"
#import "MainTabBarController.h"
#import "common.h"
#import "UIViewExt.h"

@interface LaunchViewContrller ()

@end

@implementation LaunchViewContrller{
    NSMutableArray *imageViewArray;
    
    NSInteger index;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
    
    //1.创建图片视图
    [self _createImageView];
    
    //2.开始动画
    [self startAnimation];

   // self.view.backgroundColor
}

- (void)_createImageView{
    
    NSInteger count = 24; //图片数量
    CGFloat width = kWidth / 4;
    CGFloat height = kHeight / 6;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    imageViewArray = [NSMutableArray array] ;
    
    for (NSInteger i = 0; i < count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        
        imageView.alpha = 0;
        NSString *imageName = [NSString stringWithFormat:@"%ld.png",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        
        
        
        [imageViewArray addObject:imageView];
        
        if (i <= 3) {
            
            x = i * width;
            y = 0;
        }
        else if(i <= 8){
        
        
            x = kWidth - width;
            y = (i - 3) * height;
        
        }
        else if(i <= 11){
        
            y = kHeight - height;
            x = kWidth -  (i - 7) * width;
        }
        else if(i <= 15){
        
            x = 0;
            y = kHeight - (i - 10)*height;
        
        }
        else if(i <= 17){
        
            y = height;
            x = (i - 15)*width;
        }
        else if(i <= 20){
        
            x = 2 * width;
            y = (i - 16) * height;
        
        }
        else if(i <= 23){
        
            x = width;
            y = kHeight - (i - 19) * height;
        
        }
        
        imageView.origin = CGPointMake(x, y);
        
    }
    

}

- (void)startAnimation{
    
    //1.判断循环条件
    if (index >= imageViewArray.count) {
     
        //动画执行完毕
        
        // widow.rootView =
        
        //取得主窗口
//     1. UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        //2. self.view.window; 视图当前必须显示在屏幕上
        UIWindow *window =  self.view.window;
        

        MainTabBarController *mainCtrl = [[MainTabBarController alloc] init];
        
//        mainCtrl.view.transform = CGAffineTransformMakeScale(.2, .2);
//        
//        [UIView animateWithDuration:0.1 animations:^{
//            
//            mainCtrl.view.transform = CGAffineTransformIdentity;
//        }];
        
        //显示主界面
        window.rootViewController = mainCtrl;
        
        return;
        
    }
    
    UIImageView *imageView = imageViewArray[index];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.05];
    imageView.alpha = 1;
    [UIView commitAnimations];
    
    //2.更新循环变量
    index++; //24
    
    //延迟调用,递归调用显示下一张图片
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:.05];
    

}




//隐藏状态栏
- (BOOL)prefersStatusBarHidden{

    return YES;

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
