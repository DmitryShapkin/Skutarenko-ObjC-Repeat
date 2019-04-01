//
//  UIView+UITableViewCell.m
//  SK-Lesson-34 UITableView Navigation Part 2
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "UIView+UITableViewCell.h"


@implementation UIView (UITableViewCell)

- (UITableViewCell*)superCell
{
    if (!self.superview) {
        return nil;
    }
    
    if ([self.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell*)self.superview;
    }
    
    return [self.superview superCell];
}

@end
