//
//  ViewController.m
//  ui(画画)
//
//  Created by Ibokan2 on 16/6/16.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
@interface ViewController ()
{
    AView *AV;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AV =[[AView alloc] initWithFrame:CGRectMake(0, 20, 414, 472)];
    AV.backgroundColor = [UIColor blackColor];
    [self.view addSubview:AV];
}
- (IBAction)shi:(UIButton *)sender {
    
}
- (IBAction)xu:(UIButton *)sender {
}
- (IBAction)hong:(UIButton *)sender {
    AV.color=[UIColor redColor];
}
- (IBAction)huang:(UIButton *)sender {
    AV.color=[UIColor yellowColor];
}
- (IBAction)ceng:(UIButton *)sender {
    AV.color=[UIColor orangeColor];
}

- (IBAction)lv:(UIButton *)sender {
    AV.color=[UIColor greenColor];
}
- (IBAction)qing:(UIButton *)sender {
    AV.color=[UIColor cyanColor];
}
- (IBAction)lan:(UIButton *)sender {
    AV.color=[UIColor blueColor];
}
- (IBAction)zi:(UIButton *)sender {
    AV.color=[UIColor purpleColor];
}
- (IBAction)sanjiao:(UIButton *)sender {
    [AV setDraw:@"sanjiao"];
}
- (IBAction)xianduan:(UIButton *)sender {
    [AV setDraw:@"xianduan"];
}
- (IBAction)juxing:(UIButton *)sender {
    [AV setDraw:@"juxing"];
}
- (IBAction)wujiao:(UIButton *)sender {
    [AV setDraw:@"wujiaoxing"];
}
- (IBAction)xingxing:(UIButton *)sender {
    [AV setDraw:@"xingxing"];
}
- (IBAction)huakuai:(UISlider *)sender {
    sender.minimumValue  = 1;
    sender.maximumValue = 10;    
    NSInteger x = (NSInteger)sender.value;
    AV.font = x;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
