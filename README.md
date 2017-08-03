# RSDSpiderDemo
iOS 端的一款免费的网络爬虫工具 ——DSpider 的 Demo 实现。

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-5.3MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

网络爬虫（又被称为网页蜘蛛，网络机器人，网页追逐者），是一种按照一定的规则，自动地抓取万维网信息的程序或者脚本，也是搜索引擎的关键技术。DSpider是一个使用Javascrip语言的客户端爬取平台，由ios/android sdk、Pc工具、以及云管理平台三部分组成。

| 名称 |1.列表页 |2.显式爬取页 |3.静默爬取页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-3/80682864.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-3/33730028.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-3/86058344.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 显式爬取进行中 | 静默爬取操作完成 |


## Advantage 框架的优势
### DSpider的9大特点
* 突破ip限制，IP限制对DSpider彻底无效
* 客户端用户授权时可手动登录，绕过验证码问题，使用户体验更友好。
* 可以抓取动态生成的网页。
* 脚本使用javascript语言，对于前端程序员0门槛。
* 爬取脚本非常容易写，代码量极少，你可以使用任何前端的js库，同时dSpider内置jQuery,让解析网页非常容易。
* 测试支持；支持本地调试，同时提供pc端测试工具。
* 强大的云管理平台；实时监视应用爬取状态、动态更新脚本、错误分析、配置下发等众多功能。
* 支持ios/android，支持静默爬取。
* 脚本商店；完整的生态系统和用户群，用户可以发布脚本到脚本商店，其它用户可以自由添加。用户无需自己写代码。

### DSpider主要特点
运行在ios/android端，第三方app只需要集成sdk即可，同时支持显示爬取和静默爬取，显示爬取有标准ui，静默爬取可以没有任何ui(app可以自定义)。同时提供了pc测试工具，它可以让脚本在pc上运行。

### 客户端爬取方案
如果能在用户端完成数据获取，后台爬虫面临的三座大山还在吗？对于ip限制，由于数据获取是在用户端完成的，我们每一个用户的ip 是不同的，ip限制则无效；对于动态验证，需要爬取用户登录后的信息时，我们肯定需要用户授权，所以对于验证码，我们可以引导用户自己操作，这根本不是问题; 对于最后一条动态网页内容的获取，这取决于客户端爬取平台的实现方式，然而，时至今日，除了dspider, 全球没有一个客户端爬取的开放平台！dspider 是第一个从端到云管理平台一体的客户端爬取平台。

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 导入静态库
添加include/spidersdk文件夹到你的工程，然后添加静态库(libspidersdk.a)编译链接: build phases=>link binary with libraries ，添加即可。

### 第二步 初始化
无论是显式爬取还是静默爬取，调用sdk的第一步都要先初始化：
```Objective-C
[dSpider init:appId];
```
创建完应用后，系统会自动为该应用分配一个 App Id, 可在用户中心查看。

### 显式爬取
#### 启动爬取
每一个爬取任务对应一个脚本，每一个爬虫都有一个id, 我们称之为sid。title为爬取进度页标题。
```
 DSpiderViewController *controller=[[DSpiderViewController alloc]init];
 controller.resultDelegate=self;
 [self presentViewController:controller animated:YES completion:nil];
 //执行1号spider(sid=1) 详情：https://dspider.dtworkroom.com/spider/1
 [controller start:1 title:@"测试"];
```
#### 获取爬取数据
通过resultDelegate处理爬取结果，下面是接口定义
```
//For DSpiderViewController delegate 
@protocol DSpiderResult<NSObject>
@optional
- (void) onSucceed:(NSString *) sessionKey data:(NSMutableArray * ) data;
- (void) onFail:(int)code :(NSString *)msg;
- (BOOL) onRetry:(int)code :(NSString *)msg;
@end
```
onRetry: 为保证爬取成功率，一个爬虫可以拥有多个爬取脚本，每个脚本都有一个优先级，然后会按优先级，从高到低下发重试(请参考帮助文档：https://dspider.dtworkroom.com/md/help)。sdk提供了干涉重试逻辑的一种机制，可以通过 实现onRetry接口来实现，如果返回为YES,则继续重试，如果为NO,则不会再重试，直接返回上次错误信息。onRetry的参数为上个脚本的错误码和错误信息。


使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSDSpiderDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

