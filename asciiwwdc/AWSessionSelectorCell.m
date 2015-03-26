//
//  AWSessionSelectorCell.m
//  asciiwwdc
//
//  Created by Kartik Patel on 3/22/15.
//  Copyright (c) 2015 Fueled By Soda. All rights reserved.
//

#import "AWSessionSelectorCell.h"

#define AWSessionSelectorCellBackgroundColor ([UIColor colorWithWhite:0.2 alpha:1.0])
#define AWSessionSelectorCellHeight 100

@interface AWSessionSelectorCell()

@property (nonatomic) UITextField *numberView;
@property (nonatomic) UITextField *titleView;
@property (nonatomic) UITextField *descriptionView;
@property (nonatomic) UITextField *trackView;

@end

@implementation AWSessionSelectorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])  {
        self.autoresizingMask = UIInterfaceOrientationMaskAll;
        self.backgroundColor = AWSessionSelectorCellBackgroundColor;
        
        self.numberView = [[UITextField alloc] init];
        [self addSubview:self.numberView];
        
        self.titleView = [[UITextField alloc] init];
        [self addSubview:self.titleView];
        
        self.descriptionView = [[UITextField alloc] init];
        [self addSubview:self.descriptionView];
        
        self.trackView = [[UITextField alloc] init];
        [self addSubview:self.trackView];
    }
    return self;
}

- (void)setNumber:(NSInteger)number title:(NSString *)title description:(NSString *)description track:(NSString *)track {
    self.numberView.text = @(number).stringValue;
    self.titleView.text = title;
    self.descriptionView.text = description;
    self.trackView.text = track;
}

//+ (CGFloat)getPreferredHeight {
//    return AWSessionSelectorCellHeight;
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat contentMargin = 10;
    CGFloat height = CGRectGetHeight(self.contentView.bounds);
    CGFloat width = CGRectGetWidth(self.contentView.bounds);
    
    self.numberView.frame = CGRectMake(contentMargin, contentMargin, width, 15);
    self.titleView.frame = CGRectMake(contentMargin, contentMargin * 2, width, 15);
    self.descriptionView.frame = CGRectMake(contentMargin, contentMargin * 3, width, 15);
    self.trackView.frame = CGRectMake(contentMargin, contentMargin * 4, width, 15);
}

@end
