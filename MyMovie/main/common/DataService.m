

#import "DataService.h"
#import "AFNetworking.h"
#define BaseUrl @"https://api.douban.com"
@implementation DataService
+ (id) getJsonDataFromFile:(NSString *)fileName{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return jsonDicOrArray;
    
}

+ (void)getJsonDataFromUrl:(NSString *)url block:(BlockType)block
{
    
    
    NSString *fullString=[BaseUrl stringByAppendingFormat:@"%@",url];
    NSLog(@"%@",fullString);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
   [manager GET:fullString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       block(responseObject);
    

   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"%@",error);
       NSLog(@"get失败");
   }];

    




}

@end
