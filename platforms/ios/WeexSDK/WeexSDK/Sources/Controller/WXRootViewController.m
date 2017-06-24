/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#import "WXRootViewController.h"
#import "WXBaseViewController.h"
#import "WXThreadSafeMutableArray.h"

typedef void(^OperationBlock)(void);

@interface WXRootViewController() <UIGestureRecognizerDelegate>

@property(nonatomic, strong) WXThreadSafeMutableArray *operationArray;
@property (nonatomic, assign) BOOL operationInProcess;
@property (nonatomic, strong) id popDelegate;

@end

@implementation WXRootViewController

- (id)initWithSourceURL:(NSURL *)sourceURL
{
    WXBaseViewController *baseViewController = [[WXBaseViewController alloc]initWithSourceURL:sourceURL];
    
    return [super initWithRootViewController:baseViewController];
}

#pragma mark -UINavigationControllerDelegate
// 导航控制器显示一个控制器完成的时候就会调用
- (void)navigationController:(nonnull UINavigationController *)navigationController didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.childViewControllers[0]) {
        // 回到根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{ // 不是根控制器
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.恢复滑动返回功能:清空滑动手势代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    // 2.想回到导航控制器的根控制器的时候,恢复滑动手势代理,目的:解决假死状态
    
    // 监听导航控制器什么时候回到根控制器
    
    // 设置导航控制器的代理,监听导航控制器什么时候回到根控制器
    self.delegate = self;
}

//reduced pop/push animation in iOS 7
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (WX_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        return [super popViewControllerAnimated:animated];
    
    __weak typeof(self) weakSelf = self;
    [self addOperationBlock:^{
        if ([self.viewControllers count] > 0 ) {
            UIViewController *viewController = [super popViewControllerAnimated:NO];
            if (!viewController) {
                weakSelf.operationInProcess = NO;
            }
        }
    }];
    
    return nil;
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (WX_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        return [super popToViewController:viewController animated:animated];
    
    __weak typeof(self) weakSelf = self;
    [self addOperationBlock:^{
        if ([weakSelf.viewControllers containsObject:viewController]) {
            NSArray *viewControllers = [super popToViewController:viewController animated:NO];
            if (viewControllers.count == 0) {
                weakSelf.operationInProcess = NO;
            }
        } else {
            weakSelf.operationInProcess = NO;
        }
    }];
    
    return nil;
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    if (WX_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        return [super popToRootViewControllerAnimated:animated];
    
    __weak typeof(self) weakSelf = self;
    [self addOperationBlock:^{
        NSArray *viewControllers = [super popToRootViewControllerAnimated:NO];
        if (viewControllers.count == 0) {
            weakSelf.operationInProcess = NO;
        }
    }];
    return nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (WX_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")){
        
        if (self.childViewControllers.count > 1) { // 不是根控制器
            
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:0 target:self action:@selector(back)];
            return;
        }
        
        [super pushViewController:viewController animated:animated];
        
        return;
    }
    
    
    [self addOperationBlock:^{
        [super pushViewController:viewController animated:NO];
    }];
    
    
}

// 点击返回按钮的时候调用
- (void)back
{
    // 回到上一个控制器
    [self popViewControllerAnimated:YES];
}

- (void)addOperationBlock:(OperationBlock)operation
{
    
    if (self.operationInProcess && [self.operationArray count]) {
        [self.operationArray addObject:[operation copy]];
    } else {
        _operationInProcess = YES;
        operation();
    }
}

#pragma mark- UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self.viewControllers count] == 1) {
        return NO;
    }
    return YES;
}

- (NSMutableArray *)pendingBlocks
{
    
    if (nil == _operationArray) {
        _operationArray = [[WXThreadSafeMutableArray alloc] init];
    }
    
    return _operationArray;
}

@end
