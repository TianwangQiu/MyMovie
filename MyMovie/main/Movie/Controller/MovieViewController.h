

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"


@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_movieTableView;//电影列表页面
    PosterView *_posterView;//海报页面
  __block  NSMutableArray *_movieModalArray;//用来存放modal对象
}

@end
