

#import <Foundation/Foundation.h>
typedef void(^BlockType)(id result);
@interface DataService : NSObject

+ (id) getJsonDataFromFile:(NSString *)fileName;
+ (void)getJsonDataFromUrl:(NSString *)url block:(BlockType)block;
@end
