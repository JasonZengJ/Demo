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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"first view"];
    CGFloat  screenFullWidth  = [UIScreen mainScreen].bounds.size.width;
    CGFloat  screenFullHeight = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"%f",screenFullWidth);
    UIView *view = [[MouseMoveView alloc] initWithFrame:CGRectMake(0, 65, screenFullWidth, screenFullHeight*0.75 - 65)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, screenFullHeight * 0.3, screenFullWidth, 30)];
    
    [label setText:@"touch and move your finger here"];
    [label setTextColor:[UIColor whiteColor]];
    [view setBackgroundColor:[UIColor redColor]];
    [view addSubview:label];
    
    
    UIButton *clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,screenFullHeight * 0.75,159 , 50)];
    [clickBtn setTitle:@"mouse click" forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [clickBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [clickBtn setBackgroundColor:[UIColor grayColor]];
    
    UIButton *vkBtn = [[UIButton alloc] initWithFrame:CGRectMake(161, screenFullHeight * 0.75, 160, 50)];
    [vkBtn setTitle:@"virtual keybord" forState:UIControlStateNormal];
    [vkBtn addTarget:self action:@selector(vkBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [vkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [vkBtn setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:view];
    [self.view addSubview:clickBtn];
    [self.view addSubview:vkBtn];
}
- (void)btnClick:(id)sender{
    
    self.nextViewController = [[NextViewController alloc]init];
    NSString *mapsUrl = @"maps://";
    NSString *widUrl  = @"wid://";
    BOOL canOpenUrl   = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:widUrl]];
    NSString *url     = canOpenUrl ? widUrl : mapsUrl ;
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//    [self.navigationController pushViewController:self.nextViewController animated:YES];
    
}

- (void)vkBtnClick:(id)sender{
    [self alert:@"open virtual keybord"];
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
