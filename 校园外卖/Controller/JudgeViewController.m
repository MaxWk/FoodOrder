//
//  JudgeViewController.m
//  校园外卖
//
//  Created by MAX_W on 16/5/30.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import "JudgeViewController.h"

@interface JudgeViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *commitButton;
- (IBAction)commit:(id)sender;
@property(nonatomic,strong) UILabel *label;
@end

@implementation JudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价";
    self.view.backgroundColor = RGBColor(238, 238, 238);
    UITextView *input = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    input.backgroundColor = [UIColor whiteColor];
    input.delegate = self;
    [self.view addSubview:input];

    UIView *LabelView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 30)];
    LabelView.backgroundColor = [UIColor whiteColor];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 0, 70, 30)];
    [LabelView addSubview:_label];
    _label.text = @"0/100";
    _label.textColor = [UIColor grayColor];
    [self.view addSubview:LabelView];
    _commitButton.layer.cornerRadius = 8;
}


-(void)textViewDidChange:(UITextView *)textView
{
    _label.text = [NSString stringWithFormat:@"%d/100",textView.text.length];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location>=100)
    {
        return  NO;
    }
    else
    {
        return YES;
    }
}

- (IBAction)commit:(id)sender {
    [MBProgressHUD showSuccess:@"提交成功！"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
