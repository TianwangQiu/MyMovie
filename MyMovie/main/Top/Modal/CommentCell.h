

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;


@property(nonatomic,strong)Comment *comment;
@end
