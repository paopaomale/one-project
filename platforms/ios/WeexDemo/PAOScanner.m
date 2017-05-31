//
//  PAOScanner.m
//  WeexDemo
//
//  Created by paopao on 2017/5/15.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "PAOScanner.h"
#import "WXScannerVC.h"
#import "WXDemoViewController.h"

@implementation PAOScanner

@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(openScanner));

- (void)openScanner {
    WXScannerVC * scanViewController = [[WXScannerVC alloc] init];
    [[weexInstance.viewController navigationController] pushViewController:scanViewController animated:YES];
}


@end
