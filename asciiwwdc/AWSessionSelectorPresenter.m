//
//  AWSessionSelectorPresenter.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorPresenter.h"
#import <ASYPresenterSupport/UIView+ASYPresenterSupport.h>

@interface AWSessionSelectorPresenter()<AWSessionSelectorModelObserver>

@property (nonatomic, readonly) AWSessionSelectorModel *model;
@property (nonatomic, readonly) UITableView *view;
@property (nonatomic, readonly) AWSessionSelectorDelegate *delegate;
@property (nonatomic, readonly) AWSessionSelectorDataSource *dataSource;

@end

@implementation AWSessionSelectorPresenter

+ (void)bindWithModel:(AWSessionSelectorModel *)model view:(UITableView *)view delegate:(AWSessionSelectorDelegate *)delegate dataSource:(AWSessionSelectorDataSource *)dataSource {
    AWSessionSelectorPresenter *presenter = [[self alloc] initWithModel:model view:view delegate:delegate dataSource:dataSource];
    [view retainPresenter:presenter];
}

- (instancetype)initWithModel:(AWSessionSelectorModel *)model view:(UITableView *)view delegate:(AWSessionSelectorDelegate *)delegate dataSource:(AWSessionSelectorDataSource *)dataSource {
    if (self = [super init]) {
        [model escAddObserver:self];
        _model = model;
        _view = view;
        _delegate = delegate;
        _dataSource = dataSource;
        
        [self modelUpdated];
    }
    return self;
}

- (void)modelUpdated {
    self.dataSource.sessions = self.model.sessions;
    [self.view reloadData];
}

@end
