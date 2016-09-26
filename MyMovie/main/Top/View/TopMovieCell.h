

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModal.h"


@interface TopMovieCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (nonatomic,assign) MovieModal *modal;

@end
