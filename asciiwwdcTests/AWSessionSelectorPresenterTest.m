//
//  AWSessionSelectorPresenterTest.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Stubble/Stubble.h>
#import "AWSessionSelectorPresenter.h"
#import "AWSessionData.h"

@interface AWSessionSelectorPresenterTest : XCTestCase {
    AWSessionSelectorModel<ESCObservableInternal> *model;
    UITableView *view;
    AWSessionSelectorDelegate *delegate;
    AWSessionSelectorDataSource *dataSource;
    NSDictionary *sessions;
}

@end

@implementation AWSessionSelectorPresenterTest

- (void)setUp {
    [super setUp];
    
    model = mock(AWSessionSelectorModel.class);
    [model escRegisterObserverProtocol:@protocol(AWSessionSelectorModelObserver)];
    view = mock(UITableView.class);
    delegate = mock(AWSessionSelectorDelegate.class);
    dataSource = mock(AWSessionSelectorDataSource.class);
    
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

- (void)testWhenModelUpdatedThenDataSourceSessionsIsSet {
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
    
    [when(model.sessions) thenReturn:sessions];
    [model.escNotifier modelUpdated];
    
    verifyCalled([dataSource setSessions:sessions]);
}

- (void)testWhenModelUpdatedThenViewIsReloaded {
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
    
    [model.escNotifier modelUpdated];
    
    verifyCalled([view reloadData]);
}

- (void)testWhenModelUpdatedThenDataSourceSessionsIsSetAndViewIsReloadedInOrder {
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
    
    resetMock(model);
    resetMock(view);
    
    [when(model.sessions) thenReturn:sessions];
    [model.escNotifier modelUpdated];
    
    SBLOrderToken *orderToken = orderToken();
    verifyInOrder(orderToken, [dataSource setSessions:sessions]);
    verifyInOrder(orderToken, [view reloadData]);
}

- (void)testWhenPresenterCreatedThenModelIsUpdatedAndViewIsReloaded {
    [when(model.sessions) thenReturn:sessions];
    
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
    
    verifyCalled([dataSource setSessions:sessions]);
    verifyCalled([view reloadData]);
}

@end
