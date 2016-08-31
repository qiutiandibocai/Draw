//
//  AView.h
//  ui(画画)
//
//  Created by Ibokan2 on 16/6/16.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AView : UIView
{
    NSMutableArray *lines;
    CGPoint begin;
    CGPoint end;
    NSMutableArray *points;
}
@property (nonatomic,strong)UIColor *color;
@property(nonatomic,assign)NSInteger font;
@property(nonatomic,strong)NSString *draw;

@end
