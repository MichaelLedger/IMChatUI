//
//  SceneDelegate+SSAdd.m
//  IMChatUIDemo
//
//  Created by MountainX on 2019/10/25.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "SceneDelegate+SSAdd.h"

@implementation SceneDelegate (SSAdd)

//获取当前场景
+(UIWindowScene *)currentScene API_AVAILABLE(ios(13.0)) {
    UIWindowScene *currentScene = nil;
    for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
        if ([scene isKindOfClass:[UIWindowScene class]] && scene.activationState == UISceneActivationStateForegroundActive) {
            currentScene = (UIWindowScene *)scene;
            break;
        }
    }
    return currentScene;
}

@end
