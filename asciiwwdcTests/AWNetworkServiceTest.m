//
//  AWNetworkServiceTest.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/25/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AWNetworkService.h"

@interface AWNetworkServiceTest : XCTestCase

@end

@implementation AWNetworkServiceTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenGetSessionCompletedThenCompletionBlockIsCalled {
    AWNetworkService *testObject = [[AWNetworkService alloc] init];
    
    XCTestExpectation *completionBlockExpectation = [self expectationWithDescription:@"completion block"];
//    __block BOOL completed = false;
    
    AWNetworkServiceBlock completionBlock = ^(BOOL success, NSArray *responseData) {
//        completed = true;
        [completionBlockExpectation fulfill];
    };
    
    [testObject getSessionsWithCompletion:completionBlock];
    
//    XCTAssertTrue(completed);
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

@end
