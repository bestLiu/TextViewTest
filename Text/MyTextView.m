//
//  MyTextView.m
//  Text
//
//  Created by liuchun on 15/9/1.
//  Copyright (c) 2015年 liuchun. All rights reserved.
//

#import "MyTextView.h"
@interface MyTextView ()

@property (nonatomic, assign)NSRange range;

@end

@implementation MyTextView

- (instancetype)initWithFrame:(CGRect)frame text:(NSMutableAttributedString *)text range:(NSRange)aRange
{
    if (self = [super initWithFrame:frame]) {
        self.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
        self.attributedText = text;
        self.textAlignment = NSTextAlignmentCenter;
        self.editable = NO;
        self.range = aRange;

    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.selectedRange = self.range;
    NSArray *rects = [self selectionRectsForRange:self.selectedTextRange];
    self.selectedRange = NSMakeRange(0, 0);
    for (UITextSelectionRect *selectionRect in rects)
    {
        CGRect rect = selectionRect.rect;
        if (CGRectContainsPoint(rect, point)) {
            if ([self.theDelegate respondsToSelector:@selector(selectedRangeFinishedWithRect:)]) {
                [self.theDelegate selectedRangeFinishedWithRect:rect];
            }
            break;
        }
    }
    
    
}

@end
