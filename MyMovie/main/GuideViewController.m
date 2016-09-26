
#import "GuideViewController.h"

#import "LaunchViewContrller.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self _creatSubView];
    // Do any additional setup after loading the view.
}

- (void)_creatSubView{

    for (NSInteger i= 0; i < 5; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"guide%ld@2x.png",i + 1];
        NSString *pageImageName = [NSString stringWithFormat:@"guideProgress%ld@2x.png",i + 1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth* i, 0, kWidth, kHeight)];
        
        [imageView setImage:[UIImage imageNamed:imageName]];
        [_scrollView addSubview:imageView];
        
        
        UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kWidth - 173) / 2 +kWidth * i  , kHeight - 50, 173, 26)];
        
        [pageImageView setImage:[UIImage imageNamed:pageImageName]];
        [_scrollView addSubview:pageImageView];
    }
    
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(5*kWidth, kHeight);
    _scrollView.pagingEnabled = YES;

}


//当滑动视图,减速停止时,调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSInteger index =  scrollView.contentOffset.x / kWidth;
    
    if (index == 4) {
        
        _btn.hidden = NO;
    }else{
        _btn.hidden = YES;
    }
    
}      // called when scroll view grinds to a halt




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)btnAction:(id)sender {
    
    LaunchViewContrller *launch = [[LaunchViewContrller alloc] init];
    
    self.view.window.rootViewController = launch;
    
   
}
@end
