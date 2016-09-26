

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if ( self ) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];//
       // _imageView.backgroundColor = [UIColor yellowColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        //设置代理为自己
        self.delegate = self;
        
        //scrollView 放大子视图
        /**
         *  1 设置放大倍数
            2 协议方法 viewForZoomingInScrollView
         */
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
        
        //敲击手势
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
        //敲击的次数
        doubleTap.numberOfTapsRequired = 2;
        //触摸点的个数
        doubleTap.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:doubleTap];
        
        //单击
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
        
        [self addGestureRecognizer:singleTap];
        
        
        //当双击的时候 屏蔽 单击
        [singleTap requireGestureRecognizerToFail:doubleTap];
        
    }
    return  self;
    
}

- (void)singleTap{
    NSLog(@"single");
    
    //发送通知 ，由 PhotoViewController处理
    [[NSNotificationCenter defaultCenter]postNotificationName:@"HideNavigationBarNotification" object:nil];
    
}

- (void)doubleTap{
    
    NSLog(@"doubleTap");
    
   // [self setZoomScale:1 animated:<#(BOOL)#>]
    
    if (self.zoomScale == 1) {
        [self setZoomScale:3 animated:YES];
    }else{
        [self setZoomScale:1 animated:YES];
        
    }
    
    
    
}

- (void)setImageUrlStr:(NSString *)imageUrlStr{
    _imageUrlStr = imageUrlStr;
    [self setNeedsLayout];
    
    
}

- (void)layoutSubviews{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrlStr]];
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return  _imageView;
    
}




@end
