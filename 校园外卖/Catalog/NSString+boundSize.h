//
//  NSString+boundSize.h
//  01企业交流社区
//
//  Created by White on 16/3/24.
//  Copyright © 2016年 White. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (boundSize)

-(CGSize)getRealSizeWithMaxSize:(CGSize)boundSize Font:(CGFloat )fontSize;

@end
