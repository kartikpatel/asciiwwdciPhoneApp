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

#define HeaderFieldContentType @"Content-Type"
#define HeaderFieldAccept @"Accept"
#define HeaderFieldValueJsonSerialization @"application/json"
#define HttpMethod @"GET"

- (void)getSessionsWithCompletion:(AWNetworkServiceBlock)completionBlock {
//    AWSessionData *session1 = [[AWSessionData alloc] initWithNumber:1 title:@"alpha" sessionDescription:@"A" year:2015 track:@"track1"];
//    AWSessionData *session2 = [[AWSessionData alloc] initWithNumber:2 title:@"beta" sessionDescription:@"B" year:2015 track:@"track1"];
//    AWSessionData *session3 = [[AWSessionData alloc] initWithNumber:3 title:@"charlie" sessionDescription:@"C" year:2014 track:@"track1"];
//    
//    completionBlock(true, @[session1, session2, session3]);
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:5000/"];
    NSMutableURLRequest *httpRequest = [NSMutableURLRequest requestWithURL:url];
    [httpRequest setValue:HeaderFieldValueJsonSerialization forHTTPHeaderField:HeaderFieldContentType];
    [httpRequest setValue:HeaderFieldValueJsonSerialization forHTTPHeaderField:HeaderFieldAccept];
    httpRequest.HTTPMethod = HttpMethod;
    
    [NSURLConnection sendAsynchronousRequest:httpRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *connectionError) {
        NSArray *jsonData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:NULL];
        jsonData = jsonData ?: @[];
        
        NSMutableArray *sessions = [NSMutableArray array];
        for (NSDictionary *data in jsonData) {
            NSNumber *number = data[@"number"];
            NSString *title = data[@"title"];
            NSString *description = data[@"description"];
            NSNumber *year = data[@"year"];
            NSString *track = data[@"track"];
            
            AWSessionData *session = [[AWSessionData alloc] initWithNumber:number.integerValue title:title sessionDescription:description year:year.integerValue track:track];
            [sessions addObject:session];
        }
        
        completionBlock(true, sessions);
    }];
}

@end
