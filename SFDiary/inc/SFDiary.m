//
//  SFDiary.m
//  SFDiary
//
//  Created by XJY on 2019/3/10.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFDiary.h"
#import "SFDiaryListViewController.h"
#import <SFComponent/SFInjection.h>
#import <SFComponent/SFLanguage.h>
#import <SFComponent/SFImages.h>

@implementation SFDiary

#define k_Page_SFDiaryListViewController @"Page_SFDiaryListViewController"

- (void)didFinishStartup {
    //将个人中心注入到tabbar
    NSString * componentName = [SFDiary componentName];
    NSDictionary *params = @{
                             @"componentName" : componentName,
                             @"page" : k_Page_SFDiaryListViewController,
                             @"context" : @{},
                             @"tabTitle" : [SFLanguage localizedStringWithKey:@"TabTitle" componentName:componentName],
                             @"tabImage" : [SFImages imageWithName:@"WX20190227-205248.png" componentName:componentName]
                             };
    [[SFInjection sharedInstance] injectWithIdentifier:@"Injection_SFTab"
                                                params:params];
}

- (UIViewController *)getPage:(NSString *)page context:(NSDictionary *)context {
    if (!page || page.length == 0) {
        return nil;
    }
    if ([page isEqualToString:k_Page_SFDiaryListViewController]) {
        SFDiaryListViewController *diaryListViewController = [[SFDiaryListViewController alloc] init];
        return diaryListViewController;
    }
    return nil;
}

@end
