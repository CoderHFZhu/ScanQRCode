//
//  ViewController.m
//  ScanQRCode
//
//  Created by zack on 2016/11/16.
//  Copyright © 2016年 HF. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeViewController.h"

@interface ViewController ()<QRCodeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    QRCodeViewController *qrVc = [[QRCodeViewController alloc] init];
        qrVc.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:qrVc];
    
    // 设置扫描完成后的回调
    __weak typeof (self) wSelf = self;
    [qrVc setCompletionWithBlock:^(NSString *resultAsString) {
        [wSelf.navigationController popViewControllerAnimated:YES];
        //        [[[UIAlertView alloc] initWithTitle:@"" message:resultAsString delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
    }];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reader:(QRCodeViewController *)reader didScanResult:(NSString *)result
{
    NSLog(@"%@",result);
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeController" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

@end
