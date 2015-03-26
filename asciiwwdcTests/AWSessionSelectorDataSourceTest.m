//
//  AWSessionSelectorDataSourceTest.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/25/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSessionSelectorDataSource.h"
#import "AWSessionData.h"

@interface AWSessionSelectorDataSourceTest : XCTestCase {
    NSDictionary *sessions;
}

@end

@implementation AWSessionSelectorDataSourceTest

- (void)setUp {
    [super setUp];
    
    AWSessionData *session1 = [[AWSessionData alloc] initWithNumber:1 title:@"alpha" sessionDescription:@"A" year:2015 track:@"track1"];
    AWSessionData *session2 = [[AWSessionData alloc] initWithNumber:2 title:@"beta" sessionDescription:@"B" year:2015 track:@"track1"];
    AWSessionData *session3 = [[AWSessionData alloc] initWithNumber:3 title:@"charlie" sessionDescription:@"C" year:2014 track:@"track1"];
    
    sessions = @{
                  @(2015) : @[session1, session2],
                  @(2014) : @[session3]
                };
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenSessionsNotSetThenNumberOfRowsInSectionIsZero {
    AWSessionSelectorDataSource *testObject = [[AWSessionSelectorDataSource alloc] init];
    
    NSInteger rows = [testObject tableView:nil numberOfRowsInSection:0];
    XCTAssertEqual(0, rows);
}

- (void)testWhenSessionsIsSetThenNumberOfRowsInSectionReturnsCorrectValue {
    AWSessionSelectorDataSource *testObject = [[AWSessionSelectorDataSource alloc] init];
    testObject.sessions = sessions;
    
    NSInteger rows = [testObject tableView:nil numberOfRowsInSection:0];
    XCTAssertEqual(2, rows);
    
    rows = [testObject tableView:nil numberOfRowsInSection:1];
    XCTAssertEqual(1, rows);
}

- (void)testWhenSessionsIsSetThenNumberOfsectionsReturnsCorrectValue {
    AWSessionSelectorDataSource *testObject = [[AWSessionSelectorDataSource alloc] init];
    testObject.sessions = sessions;
    
    NSInteger sections = [testObject numberOfSectionsInTableView:nil];
    XCTAssertEqual(2, sections);
}

- (void)testWhenSessionsIsSetThenTitleForHeaderInSectionReturnsCorrectValue {
    AWSessionSelectorDataSource *testObject = [[AWSessionSelectorDataSource alloc] init];
    testObject.sessions = sessions;
    
    NSString *header = [testObject tableView:nil titleForHeaderInSection:0];
    XCTAssertEqualObjects(@"2015", header);
    
    header = [testObject tableView:nil titleForHeaderInSection:1];
    XCTAssertEqualObjects(@"2014", header);
}

- (void)testCanEditRowAtIndexPathReturnsFalse {
    AWSessionSelectorDataSource *testObject = [[AWSessionSelectorDataSource alloc] init];
    BOOL editable = [testObject tableView:nil canEditRowAtIndexPath:nil];
    XCTAssertFalse(editable);
}

@end
