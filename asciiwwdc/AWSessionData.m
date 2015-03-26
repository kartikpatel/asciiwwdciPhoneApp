//
//  AWSessionData.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionData.h"

@implementation AWSessionData

- (instancetype)initWithNumber:(NSInteger)number title:(NSString *)title sessionDescription:(NSString *)sessionDescription year:(NSInteger)year track:(NSString *)track {
    if (self = [super init]) {
        _number = number;
        _title = title;
        _sessionDescription = sessionDescription;
        _year = year;
        _track = track;
    }
    return self;
}

@end
