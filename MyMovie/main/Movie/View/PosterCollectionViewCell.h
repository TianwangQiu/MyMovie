

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "MovieModal.h"
@interface PosterCollectionViewCell : UICollectionViewCell{
    PosterDetailView *_detailView;
    UIImageView *_imageView;

}
@property (nonatomic,assign)BOOL isBack;
@property (nonatomic,retain)MovieModal *modal;

- (void)flipCell;

@end
