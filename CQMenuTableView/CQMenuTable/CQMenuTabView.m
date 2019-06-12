//
//  CQTabView.m
//  SwipeViewExample
//  菜单选择栏
//  Created by pan drinking on 15/3/24.
//
//

#import "CQMenuTabView.h"
#define kSpepaceLineTag 12313
@interface CQMenuTabView ()

@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation CQMenuTabView

#pragma mark - lifeCyle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self cq_configView];
    }
    return self;
}

- (void)cq_configView {
    
    self.tabViewItems = [NSArray array];
    self.tabViewItemMargin = UIEdgeInsetsZero;
    self.layoutStyle = CQTabFillParent;
    
    self.cursorIndex = 0;
    self.cursorAnimationDuration = 0.4;
    self.cursorStyle = CQTabCursorUnderneath;
    self.cursorHeight = 2;
    self.cursorWrapInset = CGVectorMake(0, 0);
    self.cursorWidth = 0;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:self.scrollView];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.scrollsToTop = NO;
    self.cursorView = [[UIView alloc] init];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.bounds = self.bounds;
    __weak __typeof__(self) weakSelf = self;
    if (self.layoutStyle == CQTabFillParent) {
        [self.tabViewItems enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            __typeof__(self) strongSelf = weakSelf;
            CGFloat width = CGRectGetWidth(strongSelf.frame) / strongSelf.tabViewItems.count;
            view.frame = CGRectMake(idx * width, 0, width, CGRectGetHeight(strongSelf.frame));
        }];
    } else {
        __block CGFloat contentWidth = self.tabViewItemMargin.left;
        [self.tabViewItems enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            __typeof__(self) strongSelf = weakSelf;
            [view sizeToFit];
            CGFloat width = CGRectGetWidth(view.frame)+16 + strongSelf.speaceWidth;
            CGFloat viewHeight = CGRectGetHeight(strongSelf.frame);
            view.frame = CGRectMake(contentWidth, 0, width, viewHeight);
            
            contentWidth += (width + strongSelf.tabViewItemMargin.left);
            
        }];
        self.scrollView.contentSize = CGSizeMake(contentWidth, CGRectGetHeight(self.frame));
    }
    [self updateCursorToIndex:self.cursorIndex withAnimation:NO];
    
}

- (void)didTapped:(UITapGestureRecognizer *)gesture {
    
    NSInteger index = gesture.view.tag;
    if (self.didCanSelectIndex) {
        if (!self.didCanSelectIndex(gesture.view,index)) return;
    }
    
    self.cursorIndex = index;
    [self updateCursorToIndex:index];
    
    if (self.didTapItemAtIndexBlock) {
        self.didTapItemAtIndexBlock(gesture.view, index);
    }
}

- (void)moveCursorTo:(NSInteger)index withAnimation:(BOOL)animate {
    if (self.cursorWidth == 0) {
        CGRect frame = ((UIView *) self.tabViewItems[index]).frame;
        self.cursorWidth = frame.size.width;
    }
    __weak __typeof__(self) weakSelf = self;
    void (^repositionCursorBlock)(void) = ^{
        __typeof__(self) strongSelf = weakSelf;
        if (strongSelf.cursorStyle == CQTabCursorUnderneath) {
            CGRect frame = ((UIView *) strongSelf.tabViewItems[index]).frame;
            CGPoint center = ((UIView *) strongSelf.tabViewItems[index]).center;
            frame.origin.y = CGRectGetHeight(strongSelf.frame) - weakSelf.cursorHeight;
            frame.size = CGSizeMake(weakSelf.cursorWidth, weakSelf.cursorHeight);
            strongSelf.cursorView.frame = frame;
            strongSelf.cursorView.center = CGPointMake(center.x, strongSelf.cursorView.center.y);
        } else if (strongSelf.cursorStyle == CQTabCursorWrap) {
            UIView *indexView = (UIView *) strongSelf.tabViewItems[index];
            strongSelf.cursorView.frame = CGRectInset(((UIView *) strongSelf.tabViewItems[index]).frame, -strongSelf.cursorWrapInset.dx, -strongSelf.cursorWrapInset.dx);
            if (strongSelf.cursorWidth>0) {
                strongSelf.cursorView.frame = CGRectMake(0, 0, strongSelf.cursorWidth,  strongSelf.cursorView.frame.size.height);
                strongSelf.cursorView.center = indexView.center;
            }
            if (strongSelf.cursorHeight>2) {
                strongSelf.cursorView.frame = CGRectMake(0, 0, strongSelf.cursorView.frame.size.width,  strongSelf.cursorHeight);
                strongSelf.cursorView.center = indexView.center;
            }
            
        }
        [weakSelf.tabViewItems enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            __typeof__(self) strongSelf = weakSelf;
            if (idx != strongSelf.cursorIndex) {
                if (strongSelf.normalizeTabItemBlock) {
                    strongSelf.normalizeTabItemBlock(view, idx);
                }
            }
        }];
    };
    
    if (!animate) {
        repositionCursorBlock();
        [self refreshTabItemState];
        return;
    }
    
    [UIView animateWithDuration:self.cursorAnimationDuration animations:repositionCursorBlock
                     completion:^(BOOL finished) {
                         __typeof__(self) strongSelf = weakSelf;
                         [strongSelf refreshTabItemState];
                     }];
    
}

- (void)updateCursorToIndex:(NSInteger)index withAnimation:(BOOL)animate {
    
    if (index < 0 || index >= self.tabViewItems.count) {
        return;
    }
    
    self.cursorIndex = index;
    
    [self refreshTabItemState];
    
    [self moveCursorTo:index withAnimation:animate];
    
    if (self.scrollView.contentSize.width <= CGRectGetWidth(self.scrollView.frame)) {
        return;
    }
    
    UIView *selectedView = [self.scrollView viewWithTag:index];
    CGFloat offset = selectedView.frame.origin.x - CGRectGetWidth(self.frame) / 2 + CGRectGetWidth(selectedView.frame) / 2;
    CGFloat maxOffset = self.scrollView.contentSize.width - CGRectGetWidth(self.frame);
    offset = offset > 0 ? (offset > maxOffset ? maxOffset : offset) : 0;
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    
}

- (void)updateCursorToIndex:(NSInteger)index {
    [self updateCursorToIndex:index withAnimation:YES];
}

- (void)selectIndex:(NSInteger)index{
     [self updateCursorToIndex:index withAnimation:YES];
}

- (void)selectIndex:(NSInteger)index animation:(BOOL)animation{
     [self updateCursorToIndex:index withAnimation:animation];
}

- (void)refreshTabItemState {
    __weak __typeof__(self) weakSelf = self;
    [self.tabViewItems enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        __typeof__(self) strongSelf = weakSelf;
        if (idx == strongSelf.cursorIndex) {
            if (strongSelf.didSelctTitleColor) {
                if ([view isKindOfClass:[UILabel class]]) {
                    UILabel *lable = (UILabel *)view;
                    lable.textColor = strongSelf.didSelctTitleColor;
                }
            }
            if (strongSelf.didSelectTitleFont) {
                if ([view isKindOfClass:[UILabel class]]) {
                    UILabel *lable = (UILabel *)view;
                    lable.font = strongSelf.didSelectTitleFont;
                }
            }
            
            if (strongSelf.hightlightTabItemBlock) {
                strongSelf.hightlightTabItemBlock(view, idx);
            }
           
        } else {
            if (strongSelf.normaTitleColor) {
                if ([view isKindOfClass:[UILabel class]]) {
                    UILabel *lable = (UILabel *)view;
                    lable.textColor = strongSelf.normaTitleColor;
                }
            }
            if (strongSelf.titleFont) {
                if ([view isKindOfClass:[UILabel class]]) {
                    UILabel *lable = (UILabel *)view;
                    lable.font = strongSelf.titleFont;
                }
            }
            
            if (strongSelf.normalizeTabItemBlock) {
                strongSelf.normalizeTabItemBlock(view, idx);
            }
        }
    }];
}


- (void)buildTabViewWithItems:(NSArray *(^)(void))tabViewItems {
    
    NSArray * items = tabViewItems();
    self.tabViewItems = [[NSMutableArray alloc] initWithArray:items];
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (self.showCursor) {
        [self.scrollView addSubview:self.cursorView];
    }
    
    __weak __typeof__(self) weakSelf = self;
    [self.tabViewItems enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL *stop) {
        __typeof__(self) strongSelf = weakSelf;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:strongSelf action:@selector(didTapped:)];
        item.userInteractionEnabled = YES;
        item.tag = idx;
        [item addGestureRecognizer:gesture];
        [strongSelf.scrollView addSubview:item];
    }];
    
    //刷新ui
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self selectIndex:0];
}

#pragma mark - set,get
- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    __block NSArray *titleArry = titles;
    __weak __typeof__(self) weakSelf = self;
    [self buildTabViewWithItems:^NSArray * {
        __typeof__(self) strongSelf = weakSelf;
        NSMutableArray *tabViewItems = [NSMutableArray array];
        for (int i = 0;i<titles.count;i++) {
            NSString *title = titleArry[i];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,   CGRectGetWidth(strongSelf.frame)/titleArry.count, CGRectGetHeight(strongSelf.frame))];
            label.text = title;
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor blackColor];
            if (strongSelf.titleFont) {
                label.font = strongSelf.titleFont;
            }
            if (strongSelf.normaTitleColor) {
                label.textColor = strongSelf.normaTitleColor;
            }
            if (strongSelf.isSpeaceLine) {
                if (i != 0) {
                    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i*label.frame.size.width, 0, 1, strongSelf.frame.size.height)];
                    lineView.tag = kSpepaceLineTag+i;
                    lineView.backgroundColor = [UIColor blackColor];
                    if (strongSelf.speaceLineColor) {
                        lineView.backgroundColor = strongSelf.speaceLineColor;
                    }
                    if (strongSelf.speaceLineHight>1) {
                        lineView.frame = CGRectMake(lineView.frame.origin.x, lineView.frame.origin.y, lineView.frame.size.width, strongSelf.speaceLineHight);
                        lineView.center = CGPointMake(lineView.center.x, strongSelf.center.y);
                    }
                    if (strongSelf.speaceLineHight>0) {
                        lineView.frame = CGRectMake(lineView.frame.origin.x, lineView.frame.origin.y, lineView.frame.size.width, self.speaceLineHight);
                        lineView.center = CGPointMake(lineView.center.x, label.center.y);
                    }
                    [strongSelf addSubview:lineView];
                }
            }
            label.textAlignment = NSTextAlignmentCenter;
            [tabViewItems addObject:label];
        }
        return tabViewItems;
        
    }];
}

- (void)setNormaTitleColor:(UIColor *)normaTitleColor{
    _normaTitleColor = normaTitleColor;
    for (UILabel *lable in self.tabViewItems) {
        if ([lable isKindOfClass:[UILabel class]]) {
            lable.textColor = normaTitleColor;
        }
    }
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    for (UILabel *lable in self.tabViewItems) {
        if ([lable isKindOfClass:[UILabel class]]) {
            lable.font = titleFont;
        }
    }
}
-(void)setDidSelectTitleFont:(UIFont *)didSelectTitleFont{
    _didSelectTitleFont = didSelectTitleFont;
    
    if (self.tabViewItems.count == 0) {
        return;
    }
    if (self.cursorIndex > self.tabViewItems.count-1) {
        return;
    }
    //设置选中大小
    UILabel *label =  self.tabViewItems[self.cursorIndex];
    label.font = self.didSelectTitleFont;
    
}
- (void)setDidSelctTitleColor:(UIColor *)didSelctTitleColor{
    _didSelctTitleColor = didSelctTitleColor;
    if (self.tabViewItems.count == 0) {
        return;
    }
    if (self.cursorIndex > self.tabViewItems.count-1) {
        return;
    }
    UILabel *lable = self.tabViewItems[self.cursorIndex];
    if ([lable isKindOfClass:[UILabel class]]) {
        lable.textColor = didSelctTitleColor;
    }
}

- (void)setSpeaceLineColor:(UIColor *)speaceLineColor{
    _speaceLineColor = speaceLineColor;
    for (int i = 0; i<self.tabViewItems.count; i++) {
        UIView *lineView = [self viewWithTag:i+kSpepaceLineTag];
        if (lineView) {
            lineView.backgroundColor = speaceLineColor;
        }else{
            if (i != 0) {
                UILabel *lable = self.tabViewItems[i];
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i*lable.frame.size.width, 0, 1, self.frame.size.height)];
                lineView.tag = kSpepaceLineTag+i;
                lineView.backgroundColor = [UIColor grayColor];
                lineView.backgroundColor = speaceLineColor;
                [self addSubview:lineView];
            }
        }
    }
}

- (void)setSpeaceLineHight:(CGFloat)speaceLineHight{
    _speaceLineHight = speaceLineHight;
     UIView *contentView = self.tabViewItems.firstObject;
    for (int i = 0; i<self.tabViewItems.count; i++) {
        UIView *lineView = [self viewWithTag:i+kSpepaceLineTag];
        if (lineView) {
            lineView.frame = CGRectMake(lineView.frame.origin.x, lineView.frame.origin.y, lineView.frame.size.width, self.speaceLineHight);
            lineView.center = CGPointMake(lineView.center.x, contentView.center.y);
        }
    }
}

- (void)setLayoutStyle:(CQTabLayoutStyle)layoutStyle{
    _layoutStyle = layoutStyle;
    [self layoutSubviews];
}

@end
