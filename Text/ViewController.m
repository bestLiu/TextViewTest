//
//  ViewController.m
//  Text
//
//  Created by liuchun on 15/9/1.
//  Copyright (c) 2015年 liuchun. All rights reserved.
//

#import "ViewController.h"
#import "MyTextView.h"

@interface ViewController ()<MyTextViewDelegate>

@property (strong, nonatomic) MyTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *string = @"123《我爱你》123";
    NSRange range = NSMakeRange(3, 5);
    
    
    UIFont *font1 = [UIFont systemFontOfSize:20];
    UIFont *font2 = [UIFont systemFontOfSize:25];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font1}];
    [attStr setAttributes:@{NSFontAttributeName:font2,NSForegroundColorAttributeName:[UIColor blueColor]} range:range];
    self.textView = [[MyTextView alloc] initWithFrame:CGRectMake(20, 100, 280, 40) text:attStr range:range] ;
    _textView.theDelegate = self;
    [self.view addSubview:_textView];
    
}

- (void)selectedRangeFinishedWithRect:(CGRect)rect
{
    UIView *coverView = [[UIView alloc] initWithFrame:rect];
    coverView.backgroundColor = [UIColor greenColor];
    coverView.layer.cornerRadius = 5;
    [_textView insertSubview:coverView atIndex:0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [coverView removeFromSuperview];
    });
 

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
