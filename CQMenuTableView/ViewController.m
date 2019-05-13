//
//  ViewController.m
//  menuTableView
//
//  Created by XHL on 2019/4/18.
//  Copyright © 2019 XHL. All rights reserved.
//

#import "ViewController.h"
#import "CQMenuTabView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self menTable1];
    [self menTable2];
    [self menTable3];
    [self menTable4];
    [self menTable5];
    [self menTable6];
    [self menTable7];
    [self menTable8];
    [self menTable9];
    // Do any additional setup after loading the view.
}

- (void)menTable1{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(0, 50, UIScreen.mainScreen.bounds.size.width, 44)];
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabWrapContent;
    menTable.showCursor = false;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    
}

- (void)menTable2{
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
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
}

- (void)menTable3{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 150, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorUnderneath;
    menTable.layoutStyle = CQTabWrapContent;
    menTable.cursorHeight = 41;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
}

- (void)menTable4{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 150, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorUnderneath;
    menTable.layoutStyle = CQTabFillParent;
    menTable.cursorHeight = 2;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一"];
}

- (void)menTable5{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 200, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.layer.borderWidth = 0.5;
    menTable.layer.masksToBounds = YES;
    menTable.layer.borderColor = [UIColor redColor].CGColor;
    menTable.layer.cornerRadius = 5;
    
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor whiteColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabFillParent;
    //    menTable.cursorHeight = 2;
    menTable.cursorView.backgroundColor = [UIColor redColor];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一"];
}

- (void)menTable6{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 250, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.layer.borderWidth = 0.5;
    menTable.layer.masksToBounds = YES;
    menTable.layer.borderColor = [UIColor redColor].CGColor;
    menTable.layer.cornerRadius = 5;
    
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor whiteColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabFillParent;
    menTable.isSpeaceLine = YES;
    menTable.speaceLineColor = [UIColor redColor];
    menTable.cursorView.backgroundColor = [UIColor redColor];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一"];
}

- (void)menTable7{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 300, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.showCursor = YES;
    menTable.cursorStyle = CQTabCursorUnderneath;
    menTable.layoutStyle = CQTabWrapContent;
    menTable.cursorHeight = 2;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
}

- (void)menTable8{
    CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 350, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.layer.borderWidth = 0.5;
    menTable.layer.masksToBounds = YES;
    menTable.layer.borderColor = [UIColor redColor].CGColor;
    menTable.layer.cornerRadius = 5;
    
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.showCursor = false;
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabFillParent;
    menTable.isSpeaceLine = YES;
    menTable.speaceLineHight = 40;
    menTable.speaceLineColor = [UIColor redColor];
    menTable.cursorView.backgroundColor = [UIColor redColor];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一"];
}

- (void)menTable9{
     CQMenuTabView *menTable = [[CQMenuTabView alloc] initWithFrame:CGRectMake(15, 400, UIScreen.mainScreen.bounds.size.width-30, 44)];
    menTable.titleFont = [UIFont systemFontOfSize:14];
    menTable.normaTitleColor = [UIColor blackColor];
    menTable.titles = @[@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一",@"分类一"];
    menTable.didSelctTitleColor = [UIColor redColor];
    menTable.cursorStyle = CQTabCursorWrap;
    menTable.layoutStyle = CQTabWrapContent;
    menTable.showCursor = false;
    menTable.cursorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:204/255.0 alpha:1.0];
    menTable.backgroundColor = [UIColor whiteColor];
    
    menTable.didTapItemAtIndexBlock = ^(UIView *view, NSInteger index) {
        NSLog(@"...%ld",(long)index);
    };
    [self.view addSubview:menTable];
    
    
}
@end
