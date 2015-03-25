//
//  AWSessionData.h
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWSessionData : NSObject

@property (nonatomic, readonly) NSInteger number;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *desciption;
@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSString *track;

- (id)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithNumber:(NSInteger)number title:(NSString *)title desciption:(NSString *)desciption year:(NSInteger)year track:(NSString *)track;

@end
