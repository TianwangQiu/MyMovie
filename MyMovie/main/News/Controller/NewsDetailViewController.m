

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //一  从网络直接加载
    //01 创建 webView  url
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    //02 创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [webView loadRequest:request];
    

    
    //二 本地加载
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news.html" ofType:nil];
    
   // NSString *htmlStr = [NSString stringWithContentsOfFile:filePath usedEncoding:NSUTF8StringEncoding error:nil];
    
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [webView loadHTMLString:htmlStr baseURL:nil];
    

    [self.view addSubview:webView];

    
    
    
    // Do any additional setup after loading the view.
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
