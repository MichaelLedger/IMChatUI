//
//  RootViewController.m
//  IMChatUIDemo
//
//  Created by MountainX on 2019/10/24.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "SSChatController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"IMChat";
    
    SSChatController *chatVc = [[SSChatController alloc] init];
    [self addChildViewController:chatVc];
    [self.view addSubview:chatVc.view];
    [chatVc didMoveToParentViewController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
