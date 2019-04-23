# CQMenuTableView
一个支持多种形式的菜单,实用,扩展性强,使用简单


<img src="https://upload-images.jianshu.io/upload_images/3889208-5814e16913b31671.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="iOS ScreenShot 1" width="240px" style="width: 240px;" />

# Requirements
- iOS 7.0 or later
- ARC

# Usage

##只有标题

	#import "CQMenuTabView.h"
	
	CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 100, UIScreen.mainScreen.bounds.size.width-30, 44)];
	menTable.titleFont = [UIFont systemFontOfSize:14];
	menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabWrapContent;
    menTable.cursorHeight = 41;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    //点击事件
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
    

##其他样式,自定义

	buildTabViewWithItems 使用这个函数自定义
	
# Install
## CocoaPods

```
pod 'CQMenuTableView'
```

# License
[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php
[GPL]: http://www.gnu.org/licenses/gpl.html
[BSD]: http://opensource.org/licenses/bsd-license.php
[MIT license][MIT].
