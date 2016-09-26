

#import <UIKit/UIKit.h>
#import "PosterColletionView.h"
#import "IndexCollectionView.h"

@interface PosterView : UIView{
    UIView *_headerView;//头部视图
    
    IndexCollectionView *_indexCollectionView;//小海报
    PosterColletionView *_posterColletionView;//大海报 视图
    
    UILabel *_bottomTitleLable;//底部标题视图
    
    UIControl *_coverView;//阴影笼罩视图

}
@property (nonatomic,retain)NSArray *movieModalArray;


@end
