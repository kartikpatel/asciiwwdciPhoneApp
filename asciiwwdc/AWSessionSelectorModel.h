//
//  AWSessionSelectorModel.h
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <ESCObservable/ESCObservable.h>
#import "AWNetworkService.h"

@protocol AWSessionSelectorModelObserver

- (void)modelUpdated;

@end

@interface AWSessionSelectorModel : NSObject<ESCObservable>

@property (nonatomic, readonly) NSDictionary *sessions;

- (id)init UNAVAILABLE_ATTRIBUTE;
- (id)initWithNetworkService:(AWNetworkService *)networkService;

@end
