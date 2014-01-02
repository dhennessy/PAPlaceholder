//
//  PAPlaceholderViewController.m
//
//  Created by Denis Hennessy on 13/12/2013.
//  Copyright (c) 2013 Denis Hennessy. All rights reserved.
//

#import "PAPlaceholderViewController.h"

@implementation PAPlaceholderViewController

- (id)init {
    self = [super init];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)sharedInit {
    if (!self.title) {
        self.title = @"Placeholder";
    }
}

- (void)loadView {
    _placeholderView = [[PAPlaceholderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _placeholderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _placeholderView.titleLabel.text = self.title;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    
    _placeholderView.titleLabel.text = self.title;
}

- (void)setSubtitle:(NSString *)subtitle {
    _subtitle = subtitle;
    _placeholderView.subtitleLabel.text = subtitle;
}

@end
