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

@interface AWSessionSelectorPresenterTest : XCTestCase {
    AWSessionSelectorModel<ESCObservableInternal> *model;
    UITableView *view;
    AWSessionSelectorDelegate *delegate;
    AWSessionSelectorDataSource *dataSource;
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
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenModelUpdatedThenDataSourceSessionsIsSet {
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
    
    NSDictionary *sessions = @{};
    [when(model.sessions) thenReturn:sessions];
    [model.escNotifier modelUpdated];
    
    verifyCalled([dataSource setSessions:sessions]);
}

@end
