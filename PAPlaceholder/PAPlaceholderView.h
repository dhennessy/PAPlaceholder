//
//  PAPlaceholderView.h
//
//  Created by Denis Hennessy on 13/12/2013.
//  Copyright (c) 2013 Denis Hennessy. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#define XXColor UIColor
#define XXFont  UIFont
#define XXLabel UILabel
#define XXView  UIView
#else
#define XXColor NSColor
#define XXFont  NSFont
#define XXLabel NSTextField
#define XXView  NSView
#endif

@interface PAPlaceholderView : XXView {
    XXLabel *_topDim;
    XXLabel *_leftDim;
}

@property (nonatomic, assign) float dimensionInset;   // How far to inset dimension line (0.0 - 1.0), defaults to 0.1
@property (readonly) XXLabel *titleLabel;
@property (readonly) XXLabel *subtitleLabel;
@property (readonly) XXColor *lineColor;
#if !TARGET_OS_IPHONE
@property (nonatomic, strong) XXColor *backgroundColor;
#endif

@end
