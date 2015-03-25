//
//  AWSessionSelectorDataSource.h
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import <UIKit/UITableView.h>
#import "AWSessionSelectorCell.h"

@interface AWSessionSelectorDataSource : NSObject<UITableViewDataSource>

@property (nonatomic) NSDictionary *sessions;

@end
