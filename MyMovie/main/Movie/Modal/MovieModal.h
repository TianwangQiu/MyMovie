

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject
@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) NSDictionary * images;
@property (nonatomic,assign) float average;

@end
