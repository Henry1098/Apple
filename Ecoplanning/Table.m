//
//  Table.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 06/09/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Table.h"
#import "Globals.h"

@implementation Table
int colonneselectionne;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)mouseDown:(NSEvent *)event
{
    NSPoint point = [self convertPoint:[event locationInWindow]fromView:nil];
    colonneselectionne = [NSNumber numberWithInt:[self columnAtPoint:point]];
}
@end
