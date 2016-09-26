

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *yearLable;

@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (weak, nonatomic) IBOutlet StarView *starView;

@property (nonatomic,retain) MovieModal *modal;

@end
