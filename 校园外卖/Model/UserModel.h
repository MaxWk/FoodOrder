//
//  UserModel.h
//  校园外卖
//
//  Created by MAX_W on 16/5/21.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,copy) NSString *user_id;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *password;
@property(nonatomic,copy) NSString *address;
@property(nonatomic,copy) NSString *phone;

-(NSMutableArray *)itemWithUserId:(NSString *)userid;
-(NSMutableArray *)itemWithUserId:(NSString *)userid password:(NSString *)password;
@end
