

#import "NewsModal.h"

@implementation NewsModal
//处理key跟modal变量名对应不上的情况
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
       self.newsId = [value integerValue];
   }

    
}

@end
