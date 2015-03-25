//
//  AWSessionSelectorPresenter.h
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <UIKit/UITableView.h>
#import "AWSessionSelectorModel.h"
#import "AWSessionSelectorDelegate.h"
#import "AWSessionSelectorDataSource.h"

@interface AWSessionSelectorPresenter : NSObject

+ (void)bindWithModel:(AWSessionSelectorModel *)model view:(UITableView *)view delegate:(AWSessionSelectorDelegate *)delegate dataSource:(AWSessionSelectorDataSource *)dataSource;

- (id)init UNAVAILABLE_ATTRIBUTE;

@end
