//
//  ASSessionSelectorModelTest.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Stubble/Stubble.h>
#import "AWSessionSelectorModel.h"
#import "AWSessionData.h"

@interface ASSessionSelectorModelTest : XCTestCase {
    AWNetworkService *networkService;
    AWSessionData *session1;
    AWSessionData *session2;
    AWSessionData *session3;
}

@end

@implementation ASSessionSelectorModelTest

- (void)setUp {
    [super setUp];
    
    session1 = [[AWSessionData alloc] initWithNumber:1 title:@"alpha" sessionDescription:@"A" year:2015 track:@"track1"];
    session2 = [[AWSessionData alloc] initWithNumber:2 title:@"beta" sessionDescription:@"B" year:2015 track:@"track1"];
    session3 = [[AWSessionData alloc] initWithNumber:3 title:@"charlie" sessionDescription:@"C" year:2014 track:@"track1"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenModelIsCreatedThenSessionsIsNull {
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    XCTAssertNil(testObject.sessions);
}

- (void)testWhenModelAsksNetworkServiceForSessionsDataAndOneYearOfDataReturnedThenSessionsIsUpdateCorrectly {
    networkService = mock(AWNetworkService.class);
    
    AWNetworkServiceBlock completionBlock = NULL;
    when([networkService getSessionsWithCompletion:capture(&completionBlock)]);
    
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    
    completionBlock(true, @[session1, session2]);
    
    NSDictionary *sessions = testObject.sessions;
    NSArray *sessionsIn2015 = sessions[@(2015)];
    AWSessionData *session = sessionsIn2015[0];
    XCTAssertEqual(1, session.number);
    session = sessionsIn2015[1];
    XCTAssertEqual(2, session.number);
}

- (void)testWhenModelAsksNetworkServiceForSessionsDataAndMultipleYearsOfDataReturnedThenSessionsIsUpdateCorrectly {
    networkService = mock(AWNetworkService.class);
    
    AWNetworkServiceBlock completionBlock = NULL;
    when([networkService getSessionsWithCompletion:capture(&completionBlock)]);
    
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    
    completionBlock(true, @[session1, session2, session3]);
    
    NSDictionary *sessions = testObject.sessions;
    NSArray *sessionsIn2015 = sessions[@(2015)];
    AWSessionData *session = sessionsIn2015[0];
    XCTAssertEqual(1, session.number);
    session = sessionsIn2015[1];
    XCTAssertEqual(2, session.number);
    NSArray *sessionsIn2014 = sessions[@(2014)];
    session = sessionsIn2014[0];
    XCTAssertEqual(3, session.number);
}

- (void)testWhenModelAsksNetworkServiceForSessionsDataAndWasNotSuccessfulThenSessionsIsUpdateCorrectly {
    networkService = mock(AWNetworkService.class);
    
    AWNetworkServiceBlock completionBlock = NULL;
    when([networkService getSessionsWithCompletion:capture(&completionBlock)]);
    
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    
    completionBlock(false, nil);
    
    XCTAssertNil(testObject.sessions);
}

- (void)testWhenModelAsksNetworkServiceForSessionsDataAndWasSuccessfulThenObserverIsNotified {
    networkService = mock(AWNetworkService.class);
    
    AWNetworkServiceBlock completionBlock = NULL;
    when([networkService getSessionsWithCompletion:capture(&completionBlock)]);
    
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    
    id<AWSessionSelectorModelObserver> observer = mock(@protocol(AWSessionSelectorModelObserver));
    [testObject escAddObserver:observer];
    
    completionBlock(true, @[session1]);
    
    verifyCalled([observer modelUpdated]);
}

- (void)testWhenModelAsksNetworkServiceForSessionsDataAndWasNotSuccessfulThenObserverIsNotNotified {
    networkService = mock(AWNetworkService.class);
    
    AWNetworkServiceBlock completionBlock = NULL;
    when([networkService getSessionsWithCompletion:capture(&completionBlock)]);
    
    AWSessionSelectorModel *testObject = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    
    id<AWSessionSelectorModelObserver> observer = mock(@protocol(AWSessionSelectorModelObserver));
    [testObject escAddObserver:observer];
    
    completionBlock(false, nil);
    
    verifyNever([observer modelUpdated]);
}

@end
