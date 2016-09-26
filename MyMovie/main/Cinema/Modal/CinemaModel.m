


#import "CinemaModel.h"

@implementation CinemaModel

//- (void)setAttributes:(NSDictionary *)jsonDic {
//    [super setAttributes:jsonDic];
//    
//    self.cinemaId = [jsonDic objectForKey:@"id"];
//}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"id"]) {
        
        
        self.cinemaId = value;
    }

}
@end
