//
//  AWSessionSelectorDataSource.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorDataSource.h"
#import "AWSessionData.h"

@interface AWSessionSelectorDataSource()

@property NSArray *keys;

@end

@implementation AWSessionSelectorDataSource

- (void)setSessions:(NSDictionary *)sessions {
    _sessions = sessions;
    if (self.sessions) {
        NSArray *keys = self.sessions.allKeys;
        NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
        self.keys = [keys sortedArrayUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    } else {
        self.keys = nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numOfRows = 0;
    if (self.sessions) {
        NSNumber *key = self.keys[section];
        numOfRows = [self.sessions[key] count];
    }
    return numOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AWSessionSelectorCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(AWSessionSelectorCell.class)];
    
    NSNumber *key = self.keys[indexPath.section];
    NSArray *sessionsForSection = self.sessions[key];
    AWSessionData *session = sessionsForSection[indexPath.row];
    [cell setNumber:session.number title:session.title description:session.sessionDescription track:session.track];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sessions.allKeys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *header = 0;
    if (self.sessions) {
        NSNumber *key = self.keys[section];
        header = [key stringValue];
    }
    return header;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return false;
}

@end
