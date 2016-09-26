

#import "BaseViewController.h"

@interface MovieDetailController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{


    NSMutableArray *commentArr;
    
    NSIndexPath *_indexPath;
}

@end
