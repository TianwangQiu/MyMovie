



#import <Foundation/Foundation.h>

/**
 *
 "id" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 },
 */


@interface NewsModal : NSObject

//key ---> modal-属性

@property (nonatomic,assign)NSInteger newsId;//id
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *summary;
@property (nonatomic,copy)NSString *image;

@end
