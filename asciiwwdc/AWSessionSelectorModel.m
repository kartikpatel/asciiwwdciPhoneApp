//
//  AWSessionSelectorModel.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorModel.h"
#import "AWSessionData.h"

@interface AWSessionSelectorModel()<ESCObservableInternal>

@property (nonatomic) NSDictionary *sessions;
@property (nonatomic, readonly) AWNetworkService *networkService;

@end

@implementation AWSessionSelectorModel

- (id)initWithNetworkService:(AWNetworkService *)networkService {
    if (self = [super init]) {
        [self escRegisterObserverProtocol:@protocol(AWSessionSelectorModelObserver)];
        _networkService = networkService;
        [self updateSessionsData];
    }
    return self;
}

- (void)updateSessionsData {
    __weak typeof(self) weakSelf = self;
    [self.networkService getSessionsWithCompletion:^(BOOL success, NSArray *responseData) {
        if (success) {
            NSMutableDictionary *sessions = [[NSMutableDictionary alloc] init];
            NSMutableArray *array;
            for (AWSessionData *session in responseData) {
                array = sessions[@(session.year)];
                if (!array) {
                    array = [[NSMutableArray alloc] init];
                    sessions[@(session.year)] = array;
                }
                [array addObject:session];
            }
            weakSelf.sessions = sessions;
            [weakSelf.escNotifier modelUpdated];
        }
    }];
}

@end
