//
//  PAPlaceholderView.h
//
//  Created by Denis Hennessy on 13/12/2013.
//  Copyright (c) 2013 Denis Hennessy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAPlaceholderView : UIView {
    UILabel *_topDim;
    UILabel *_leftDim;
}

@property (readonly) UILabel *titleLabel;
@property (readonly) UILabel *subtitleLabel;
@property (readonly) UIColor *lineColor;

@end
