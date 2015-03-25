//
//  AWNetworkService.h
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AWNetworkServiceBlock)(BOOL success, NSArray *responseData);

@interface AWNetworkService : NSObject

- (void)getSessionsWithCompletion:(AWNetworkServiceBlock)completionBlock;

@end
