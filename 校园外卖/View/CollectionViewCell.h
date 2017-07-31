//
//  CollectionViewCell.h
//  校园外卖
//
//  Created by MAX_W on 16/5/15.
//  Copyright © 2016年 MAX_W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
