//
//  TableViewController.m
//  RSDSpiderDemo
//
//  Created by WhatsXie on 2017/8/3.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "TableViewController.h"
#include "include/spidersdk/dSpider.h"

@interface TableViewController ()
@property(weak) DSpiderDataView * spiderView;
@end

@implementation TableViewController
@synthesize spiderView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Sign id
    [dSpider init:143];
    
    //添加爬取控件
    DSpiderDataView *_spiderView=[[DSpiderDataView alloc] initWithFrame:self.view.bounds];
    spiderView=_spiderView;
    //静默爬取不显示
    [spiderView setHidden:YES];
    [self.view addSubview:spiderView];
}

#pragma mark - 下面两个是显式爬取的回调
///成功回调
- (void)onSucceed:(NSString *)sessionKey data:(NSMutableArray *)data {
    [self showMessage:[NSString stringWithFormat:@"%@" ,data] :@"显式爬取成功了"];
}
///失败回调
- (void)onFail:(int)code :(NSString *)msg {
    [self showMessage:msg :@"显示爬取失败了"];
}
#pragma mark - 下面两个是静默爬取的回调
- (void)onError:(int)code :(NSString *)msg {
    if([spiderView canRetry]){
        [spiderView retry];
    }
}
- (void)onResult:(NSString *)sessionKey data:(NSMutableArray *)data {
    [self showMessage:[NSString stringWithFormat:@"%@" ,data] :@"静默爬取成功了"];
}


- (void)showMessage:(NSString *)msg :(NSString *)title{
    UIAlertView *alertView = [[UIAlertView alloc]  initWithTitle:title message:msg
                                                        delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        DSpiderViewController *controller=[[DSpiderViewController alloc]init];
        controller.resultDelegate=self;
        [self presentViewController:controller animated:YES completion:nil];
        
        [controller start:1 title:@"测试"];
    } else {
        [self showMessage:@"正在爬取，请稍等！" :@"提示"];
        spiderView.delegate=self;
        
        [spiderView start:1];
    }
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
