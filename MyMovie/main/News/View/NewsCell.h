

#import <UIKit/UIKit.h>

#import "UIImageView+WebCache.h"
#import "NewsModal.h"

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *summryLable;

@property (nonatomic,retain) NewsModal *news;

//注释
@end
