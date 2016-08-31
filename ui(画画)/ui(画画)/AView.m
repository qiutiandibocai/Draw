//
//  AView.m
//  ui(画画)
//
//  Created by Ibokan2 on 16/6/16.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "AView.h"

@implementation AView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        lines = [NSMutableArray array];
        points = [NSMutableArray array];
        _color = [UIColor whiteColor];
        _draw = @"xianduan";
        _font = 1;
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ref, 1, 0, 0, 1);
    for (int i = 0; i < lines.count; i
         ++) {
        NSDictionary *dic=[lines objectAtIndex:i];
       
        CGContextSetStrokeColorWithColor(ref, [[dic objectForKey:@"color"]CGColor]);
        CGContextSetLineWidth(ref, [[dic objectForKey:@"cuxi"]integerValue]);
            if ([[dic objectForKey:@"tuxing"] isEqualToString:@"sanjiao"]) {
                NSArray *array=[dic objectForKey:@"sanjiao1"];
                CGMutablePathRef path=CGPathCreateMutable();
                for (int j=0; j<[array count]; j++) {
                    CGPoint point=[[array objectAtIndex:j]CGPointValue];
                    if(j==0){
                        CGPathMoveToPoint(path, NULL, point.x, point.y);
                    }else{
                        CGPathAddLineToPoint(path, NULL, point.x, point.y);
                    }
                    CGContextAddPath(ref, path);
                    CGContextClosePath(ref);
                    CGContextStrokePath(ref);
                }
                
            }else if([[dic objectForKey:@"tuxing"] isEqualToString:@"xianduan"]){
                NSArray *array=[dic objectForKey:@"xianduan"];
                CGMutablePathRef path=CGPathCreateMutable();
                for (int j=0; j<array.count; j++) {
                    CGPoint point=[[array objectAtIndex:j]CGPointValue];
                    if(j==0){
                        
                        CGPathMoveToPoint(path, NULL, point.x, point.y);
                    }else{
                        
                        CGPathAddLineToPoint(path, NULL, point.x, point.y);
                    }
                    
                }
                CGContextAddPath(ref, path);
                CGContextStrokePath(ref);
            }else if ([[dic objectForKey:@"tuxing"] isEqualToString:@"juxing"]){
                CGPoint startPoint = [[dic objectForKey:@"juxing1" ]CGPointValue];
                CGPoint endPoint = [[dic objectForKey:@"juxing2"]CGPointValue];
                CGContextStrokeRect(ref, CGRectMake(startPoint.x, startPoint.y, endPoint.x-startPoint.x, endPoint.y-startPoint.y));
                CGContextStrokePath(ref);
            }else if ([[dic objectForKey:@"tuxing"] isEqualToString:@"wujiaoxing"]){
                CGPoint startPoint = [[dic objectForKey:@"wujiao1"]CGPointValue];
                CGPoint endPoint = [[dic objectForKey:@"wujiao2"]CGPointValue];
                CGPoint center = CGPointMake(startPoint.x, startPoint.y);
                CGContextMoveToPoint(ref, center.x, endPoint.y);
                for (int i = 1; i < 6; i++) {
                    CGFloat x =(endPoint.x - startPoint.x)  * sinf(i * 4.0 * M_PI / 5.0);
                    CGFloat y =(endPoint.y - startPoint.y)  * cosf(i * 4.0 * M_PI / 5.0);
                    CGContextAddLineToPoint(ref, center.x + x, center.y + y);
                }
                CGContextClosePath(ref);
                CGContextStrokePath(ref);
            }else if ([[dic objectForKey:@"tuxing"] isEqualToString:@"xingxing"]){
                NSArray *array=[dic objectForKey:@"xingxing1"];
                for (int i = 0; i < array.count; i++) {
                    if (i % 5 == 0) {
                        CGPoint point=[[array objectAtIndex:i]CGPointValue];
                        CGPoint center = CGPointMake(point.x, point.y);
                        CGContextMoveToPoint(ref, center.x, center.y+20);
                        for (int j = 0; j < 5; j++) {
                            CGFloat x =20*sinf(j*M_PI/5*4);
                            CGFloat y =20*cosf(j*M_PI/5*4);
                            CGContextAddLineToPoint(ref, center.x + x, center.y + y);
                        }
                        CGContextClosePath(ref);
                        CGContextStrokePath(ref);

                    }
                }
            }
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    begin=[touch locationInView:self];
    if(!lines)
    {
        lines=[[NSMutableArray alloc]initWithCapacity:0];
    }
    
    
    NSValue *value=[NSValue valueWithCGPoint:begin];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithCapacity:0];
    [dic setObject:_color forKey:@"color"];
    [dic setObject:_draw forKey:@"tuxing"];
    [dic setObject:@(_font) forKey:@"cuxi"];
    if ([_draw isEqualToString:@"sanjiao"]) {
        NSMutableArray *sanjiao;
//        [points removeAllObjects];
        if(points.count<3)
        {
            [points addObject:value];
        }
        if(points.count ==3)
        {
            sanjiao=[[NSMutableArray alloc]initWithArray:points];
            [dic setObject:sanjiao forKey:@"sanjiao1"];
        }
       
    }else if ([_draw isEqualToString:@"xianduan"]){
        [points removeAllObjects];
        NSMutableArray *line=[[NSMutableArray alloc]initWithCapacity:0];
        [line addObject:value];
        [dic setObject:line forKey:@"xianduan"];
    }else if ([_draw isEqualToString:@"juxing"]){
        [points removeAllObjects];
        [dic setObject:value forKey:@"juxing1"];
    }else if ([_draw isEqualToString:@"wujiaoxing"]){
        [points removeAllObjects];
        [dic setObject:value forKey:@"wujiao1"];
    }else if ([_draw isEqualToString:@"xingxing"]){
        [points removeAllObjects];
        NSMutableArray *line=[[NSMutableArray alloc]initWithCapacity:0];
        [line addObject:value];
        [dic setObject:line forKey:@"xingxing1"];

    }
    [lines addObject:dic];
     [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([_draw isEqualToString:@"sanjiao"]) {
        
        return;
    }
    UITouch *touch=[touches anyObject];
    end=[touch locationInView:self];
    NSValue *value=[NSValue valueWithCGPoint:end];
    NSMutableDictionary *dic=[lines lastObject];
    
    if ([_draw isEqualToString:@"xianduan"]){
        NSMutableArray *array=[dic objectForKey:@"xianduan"];
        [array addObject:value];
    }else if ([_draw isEqualToString:@"juxing"]){
       [dic setObject:value forKey:@"juxing2"];
    }else if ([_draw isEqualToString:@"wujiaoxing"]){
        [dic setObject:value forKey:@"wujiao2"];
    }else if ([_draw isEqualToString:@"xingxing"]){
        NSMutableArray *array=[dic objectForKey:@"xingxing1"];
        [array addObject:value];
    }
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
   

