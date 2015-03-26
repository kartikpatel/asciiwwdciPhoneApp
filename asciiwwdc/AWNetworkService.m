//
//  AWNetworkService.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWNetworkService.h"
#import "AWSessionData.h"

@implementation AWNetworkService

- (void)getSessionsWithCompletion:(AWNetworkServiceBlock)completionBlock {
    AWSessionData *session1 = [[AWSessionData alloc] initWithNumber:1 title:@"alpha" sessionDescription:@"A" year:2015 track:@"track1"];
    AWSessionData *session2 = [[AWSessionData alloc] initWithNumber:2 title:@"beta" sessionDescription:@"B" year:2015 track:@"track1"];
    AWSessionData *session3 = [[AWSessionData alloc] initWithNumber:3 title:@"charlie" sessionDescription:@"C" year:2014 track:@"track1"];
    
    completionBlock(true, @[session1, session2, session3]);
}

@end
