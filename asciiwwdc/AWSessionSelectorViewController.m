//
//  ViewController.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorViewController.h"
#import "AWSessionSelectorDelegate.h"
#import "AWSessionSelectorDataSource.h"
#import "AWSessionSelectorModel.h"
#import "AWSessionSelectorPresenter.h"

@interface AWSessionSelectorViewController ()

@end

@implementation AWSessionSelectorViewController

- (void)loadView {
    [super loadView];
    
    UITableView *view = [[UITableView alloc] initWithFrame:self.view.bounds];
    [view registerClass:[AWSessionSelectorCell class] forCellReuseIdentifier:[[AWSessionSelectorCell class] description]];
    [self.view addSubview:view];
    id<UITableViewDelegate> delegate = [[AWSessionSelectorDelegate alloc] init];
    view.delegate = delegate;
    id<UITableViewDataSource> dataSource = [[AWSessionSelectorDataSource alloc] init];
    view.dataSource = dataSource;
    AWNetworkService *networkService = [[AWNetworkService alloc] init];
    AWSessionSelectorModel *model = [[AWSessionSelectorModel alloc] initWithNetworkService:networkService];
    [AWSessionSelectorPresenter bindWithModel:model view:view delegate:delegate dataSource:dataSource];
}

@end
