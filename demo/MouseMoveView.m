//
//  MouseMoveView.m
//  demo
//
//  Created by jason on 4/21/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

#import "MouseMoveView.h"

@implementation MouseMoveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch      = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint  = [touch locationInView:self];
    NSLog(@"touches count--->%d___ and point position:(%f,%f)\n",[touches count],touchPoint.x,touchPoint.y);
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch     = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"touches count--->%d___ and point position:(%f,%f)\n",[touches count],touchPoint.x,touchPoint.y);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
