//
//  QRCodeViewController.h
//  ScanQRCode
//
//  Created by zack on 2016/11/16.
//  Copyright © 2016年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QRCodeViewController;

@protocol QRCodeViewControllerDelegate <NSObject>

/**
 *  读取到结果时会调用下面的代理方法
 *
 *  @param reader 扫描二维码控制器
 *  @param result 扫描结果
 */
- (void)reader:(QRCodeViewController *)reader didScanResult:(NSString *)result;

@end
@interface QRCodeViewController : UIViewController

@property (nonatomic, weak) id<QRCodeViewControllerDelegate> delegate;


/**
 *  设置扫描二维码完成后回调的block
 *
 *  @param completionBlock 完成block
 */
- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock;

@end
