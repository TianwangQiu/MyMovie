

#import "MoreViewController.h"
#import "common.h"
#import "UIViewExt.h"
#import "SDImageCache.h"

@interface MoreViewController ()

@end

@implementation MoreViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多";
    }
    return  self;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
    [self _loadData];
    
    NSString *homePath = NSHomeDirectory();
    
    NSLog(@"%@",homePath);


}

//当重新出现的时候刷新数据
- (void)viewWillAppear:(BOOL)animated{
    
    [_tableView reloadData];
    
}



- (void)_loadData{
    
    
    titles = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
    imageNames = @[@"moreClear@2x.png",@"moreScore@2x.png",@"moreVersion@2x.png",@"moreBusiness@2x.png",@"moreWelcome@2x.png",@"moreAbout@2x.png"];
    
}


- (void)_createTableView{
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *indenty = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indenty];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indenty];
        cell.backgroundColor = [UIColor clearColor];
        
        //1.创建图片视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        imageView.tag = 1;
        [cell.contentView addSubview:imageView];
        
        
        //2.标题视图
        UILabel *titlelable = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 30, 15, 200, 30)];
        titlelable.tag = 2;
        titlelable.font = [UIFont boldSystemFontOfSize:18];
        titlelable.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:titlelable];
        
        //单元格选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == 0) {
            
            UILabel *cacheLable = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 70, 15, 60, 30)];
            cacheLable.textAlignment = NSTextAlignmentCenter;
            cacheLable.tag = 3;
            cacheLable.font = [UIFont boldSystemFontOfSize:18];
            cacheLable.textColor = [UIColor whiteColor];
            [cell.contentView addSubview:cacheLable];
        }
        
    }
    
    //2.填充信息
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lable = (UILabel *)[cell.contentView viewWithTag:2];
    
    imageView.image = [UIImage imageNamed:imageNames[indexPath.row]];
    lable.text = titles[indexPath.row];
    
    if (indexPath.row == 0) {
        
        UILabel *cacheLable = (UILabel *)[cell.contentView viewWithTag:3];

        SDImageCache *cache = [SDImageCache sharedImageCache];
        CGFloat size = [cache getSize];
        
        cacheLable.text = [NSString stringWithFormat:@"%.1fM",size/1000/1000];

    }
    
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        UIAlertView *alert =[ [UIAlertView alloc] initWithTitle:@"提示" message:@"是否清除缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        
        [alert show];
        
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        SDImageCache *cache = [SDImageCache sharedImageCache];
        [cache clearDisk];
        
        [_tableView reloadData];
        
        
        
        
    }
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
