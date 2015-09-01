//
//  MyTextView.h
//  Text
//
//  Created by liuchun on 15/9/1.
//  Copyright (c) 2015年 liuchun. All rights reserved.
//



#import <UIKit/UIKit.h>
@protocol MyTextViewDelegate <NSObject>

@optional
- (void)selectedRangeFinishedWithRect:(CGRect)rect;

@end

@interface MyTextView : UITextView
@property (weak, nonatomic) id<MyTextViewDelegate> theDelegate;
- (instancetype)initWithFrame:(CGRect)frame text:(NSMutableAttributedString *)text range:(NSRange)aRange;

@end
