//
//  ViewController.m
//  demo
//
//  Created by jason on 4/21/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "MouseMoveView.h"

@interface ViewController ()

   @property (nonatomic,retain)NextViewController *nextViewController;
   @property (nonatomic,retain)UIAlertView *alertView;
   @property (nonatomic,retain)UIButton *mouseBtn;
   @property (nonatomic,retain)UIButton *vkBtn;
   @property (nonatomic,retain)UIButton *settingBtn;
   @property (nonatomic,retain)UIButton *moreBtn;
   @property (nonatomic)CGFloat screenFullWidth;
   @property (nonatomic)CGFloat screenFullHeight;
   @property (nonatomic)UIColor* btnBgColor;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"first view"];
    
    self.screenFullWidth  = [UIScreen mainScreen].bounds.size.width;
    self.screenFullHeight = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"%f",self.screenFullHeight - self.screenFullHeight *0.75 - 51);
    self.btnBgColor       = [UIColor colorWithRed:66.0f/255.0f green:66.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.mouseBtn         = [self createBtnWithFrame:CGRectMake(0, self.screenFullHeight * 0.73, 159, 50)        Title:@"Mouse Click"     clickAction:@selector(mouseBtnClick:)];
    self.vkBtn            = [self createBtnWithFrame:CGRectMake(160, self.screenFullHeight * 0.73, 160, 50)      Title:@"Virtual Keybord" clickAction:@selector(vkBtnClick:)];
    self.settingBtn       = [self createBtnWithFrame:CGRectMake(0, self.screenFullHeight * 0.73 + 51, 159, 50)   Title:@"Settings"        clickAction:@selector(settingBtnClick:)];
    self.moreBtn          = [self createBtnWithFrame:CGRectMake(160, self.screenFullHeight * 0.73 + 51, 160, 50) Title:@"More ......."    clickAction:@selector(moreBtnClick:)];
    UIButton *button      = [self createBtnWithFrame:CGRectMake(0, self.screenFullHeight * 0.73 + 102, self.screenFullWidth, 55) Title:@"Button" clickAction:@selector(btnClick:)];
    
    
//    self.mouseBtn.layer.borderColor = [self.btnBgColor CGColor];
//    self.mouseBtn.layer.borderWidth = 1.0f;
    
    UIView *view          = [[MouseMoveView alloc] initWithFrame:CGRectMake(0, 65, self.screenFullWidth, self.screenFullHeight*0.73 - 65)];
    UILabel *label        = [[UILabel alloc]initWithFrame:CGRectMake(30, self.screenFullHeight * 0.3, self.screenFullWidth, 30)];
    
    [label setText:@"touch and move your finger here"];
    [label setTextColor:[UIColor whiteColor]];
    [view setBackgroundColor:[UIColor redColor]];
    [view addSubview:label];
    
    
    [self.view addSubview:view];
    [self.view addSubview:self.mouseBtn];
    [self.view addSubview:self.vkBtn];
    [self.view addSubview:self.settingBtn];
    [self.view addSubview:self.moreBtn];
    [self.view addSubview:button];
    
}

- (UIButton *)createBtnWithFrame:(CGRect)frame Title:(NSString*)title clickAction:(SEL)action{
    
    UIButton* btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(changeBtnBGColor:) forControlEvents:UIControlEventTouchDown];
    
    return btn;
   
}

- (void)changeBtnBGColor:(id)sender{
    
    CGFloat red   = 66.0f/255.0f;
    CGFloat green = 66.0f/255.0f;
    CGFloat blue  = 66.0f/255.0f;
    [sender setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0f]];
    
}

- (void)btnClick:(id)sender{
    [sender setBackgroundColor:[UIColor grayColor]];
    
}

- (void)mouseBtnClick:(id)sender{
    
    [sender setBackgroundColor:[UIColor grayColor]];
    self.nextViewController = [[NextViewController alloc]init];
    NSString *mapsUrl = @"maps://";
    NSString *widUrl  = @"wid://";
    BOOL canOpenUrl   = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:widUrl]];
    NSString *url     = canOpenUrl ? widUrl : mapsUrl ;
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//    [self.navigationController pushViewController:self.nextViewController animated:YES];
    
}

- (void)vkBtnClick:(id)sender{
    
    [sender setBackgroundColor:[UIColor grayColor]];
    [self alert:@"open virtual keybord"];
    
}

- (void)settingBtnClick:(id)sender{
    
    [sender setBackgroundColor:[UIColor grayColor]];
    
}

- (void)moreBtnClick:(id)sender{
    
    [sender setBackgroundColor:[UIColor grayColor]];
    
    
}

- (void)alert:(NSString*)message{
    
    if (!self.alertView) {
        self.alertView = [[UIAlertView alloc]initWithTitle:@"alert!" message:message delegate:nil cancelButtonTitle:@"confirm" otherButtonTitles:nil];
    }
    
    [self.alertView show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
