//
//  AWSessionSelectorCell.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorCell.h"

#define AWSessionSelectorCellHeight 100

@implementation AWSessionSelectorCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

+ (CGFloat)getPreferredHeightGivenWidth:(CGFloat)width {
    return AWSessionSelectorCellHeight;
}

@end
