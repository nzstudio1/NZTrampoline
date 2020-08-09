//
//  NZTrampolineObjC.m
//  NZTrampoline
//
//  Created by H. Vakilian on 9/9/2020 AP.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import "NZTrampolineObjC.h"
#import "objc/runtime.h"

@implementation NZTrampolineObjC

-(instancetype)initWithDelegate:(NSObject*)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    if (!class_respondsToSelector(self.class, aSelector))
        return [self.delegate respondsToSelector:aSelector];
    else
        return true;
}

-(id)forwardingTargetForSelector:(SEL)aSelector {
    if (class_respondsToSelector(self.class, aSelector))
        return self;
    return self.delegate ? self.delegate : [super forwardingTargetForSelector:aSelector];
}

@end
