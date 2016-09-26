

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    NSArray *titles;
    NSArray *imageNames;
    UITableView *_tableView;
    
    
}

@end
