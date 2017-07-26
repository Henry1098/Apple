//
//  SeulementEntier.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//
// Cette classe permet la verification pour que l'utilisateur puisse
// n'entrer que des entiers

#import "SeulementEntier.h"

@implementation SeulementEntier



-(BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString *__autoreleasing  _Nullable *)newString errorDescription:(NSString *__autoreleasing  _Nullable *)error{
 __autoreleasing  NSString * _Nullable str = @"1";
    if([partialString length] == 0)
  {
      return YES;
  }

    NSScanner *scanner = [NSScanner scannerWithString:partialString];
    
    if(!([scanner scanInt:0] && [scanner isAtEnd]))
    {
        NSBeep();
        newString = &str;
        return NO;
    }
    return YES;
}
@end
