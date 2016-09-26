#import <UIKit/UIKit.h>
#import "common.h"

@interface GuideViewController : UIViewController<UIScrollViewDelegate>{


    IBOutlet UIScrollView *_scrollView;
    
    IBOutlet UIButton *_btn;

}

- (IBAction)btnAction:(id)sender;
@end
