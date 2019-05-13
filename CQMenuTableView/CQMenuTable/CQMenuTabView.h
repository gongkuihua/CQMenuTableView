//
//  CQTabView.h
//  SwipeViewExample
//  菜单选择栏
//  Created by pan drinking on 15/3/24.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CQTabLayoutStyle) {
    CQTabFillParent,
    CQTabWrapContent
};

typedef NS_ENUM(NSInteger, CQTabCursorStyle) {
    CQTabCursorUnderneath,
    CQTabCursorWrap
};


typedef void (^CQTabItemAtIndexBlock)(UIView *view, NSInteger index);

@interface CQMenuTabView : UIView

/**
 *  菜单按钮下方横线背景属性
 */
@property (nonatomic, strong) UIView *cursorView;
@property (nonatomic, assign) BOOL showCursor;
@property (nonatomic, assign) CGFloat cursorAnimationDuration;
@property (nonatomic, assign) CGFloat cursorHeight;
@property (nonatomic, assign) CGFloat cursorWidth;
@property (nonatomic, assign) CQTabCursorStyle cursorStyle;
@property (nonatomic, assign) CGVector cursorWrapInset;
@property (nonatomic, assign) NSInteger cursorIndex;
@property (nonatomic, assign) CGFloat speaceWidth;


@property (nonatomic, assign) UIEdgeInsets tabViewItemMargin;
@property (nonatomic, assign) CQTabLayoutStyle layoutStyle;
@property (nonatomic, strong) NSArray *tabViewItems;//上面的view

//只有文字的情况
@property (nonatomic, strong) NSArray *titles;//标题
@property (nonatomic, strong) UIColor *normaTitleColor;//默认状态文字颜色
@property (nonatomic, strong) UIColor *didSelctTitleColor;//点击状态文字颜色
@property (nonatomic, strong) UIFont *titleFont;//字体大小
@property (nonatomic, strong) UIFont *didSelectTitleFont;//选中字体大小
@property (nonatomic, assign) BOOL isSpeaceLine;//是否显示2个中间间隔线
@property (nonatomic, strong) UIColor *speaceLineColor;//2个中间间隔线颜色
@property (nonatomic, assign) CGFloat speaceLineHight;//2个中间间隔线高度

/**
 *  点击完状态
 */
@property(nonatomic, copy) CQTabItemAtIndexBlock hightlightTabItemBlock;

/**
 *  普通状态
 */
@property(nonatomic, copy) CQTabItemAtIndexBlock normalizeTabItemBlock;

/**
 *  点击中状态
 */
@property(nonatomic, copy) CQTabItemAtIndexBlock didTapItemAtIndexBlock;


/**
 自定义UI

 @param tabViewItems 定义的ui数组
 */
- (void)buildTabViewWithItems:(NSArray *(^)(void))tabViewItems;

/**
 选择第几个
 
 @param index 索引
 */
- (void)selectIndex:(NSInteger)index;


/**
 选择第几个

 @param index 索引
 @param animation 动画
 */
- (void)selectIndex:(NSInteger)index animation:(BOOL)animation;
@end
