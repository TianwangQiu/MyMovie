

#import "MovieDetaiModel.h"

@implementation MovieDetaiModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"release"]) {
        
        self.movieRelease = value;
    }


}
@end
