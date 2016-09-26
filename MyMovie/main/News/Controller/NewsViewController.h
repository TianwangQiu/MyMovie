

#import <UIKit/UIKit.h>
#import "BaseViewController.h"



@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{

    UITableView *_tableView;
    NSMutableArray *_newsModalArray;
    
}
@end