//
//  NSString+boundSize.m
//  01企业交流社区
//
//  Created by White on 16/3/24.
//  Copyright © 2016年 White. All rights reserved.
//

#import "NSString+boundSize.h"

@implementation NSString (boundSize)

-(CGSize)getRealSizeWithMaxSize:(CGSize)boundSize Font:(CGFloat )fontSize{
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [self  boundingRectWithSize:boundSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}
@end
