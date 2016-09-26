

#import "MovieModal.h"

@implementation MovieModal

// 复写description方法 ，能够实现%@打印输出
- (NSString *)description{
    
    NSString *str = [NSString stringWithFormat:@"year=%@,title=%@",_year,_title];
    return  str;
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"rating"]) {
        _average = [[value objectForKey:@"average"] floatValue];
    }
    

    
}

@end
