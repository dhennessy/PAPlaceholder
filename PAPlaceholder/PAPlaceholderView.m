//
//  PAPlaceholderView.m
//
//  Created by Denis Hennessy on 13/12/2013.
//  Copyright (c) 2013 Denis Hennessy. All rights reserved.
//

#import "PAPlaceholderView.h"

#define DIM_HEIGHT      24
#define TITLE_HEIGHT    24
#define LABEL_MARGINS   10

@implementation PAPlaceholderView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)sharedInit {
    _dimensionInset = 0.1;
    CGRect frame = self.frame;
    self.backgroundColor = [XXColor colorWithRed:0.227 green:0.286 blue:0.396 alpha:1.0];
    _lineColor = [XXColor colorWithRed:0.675 green:0.808 blue:0.863 alpha:1.0];
    _topDim = [[XXLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, DIM_HEIGHT)];
    _topDim.textColor = _lineColor;
    [self addSubview:_topDim];
    _leftDim = [[XXLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, DIM_HEIGHT)];
    _leftDim.textColor = _lineColor;
    [self addSubview:_leftDim];
    _titleLabel = [[XXLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, TITLE_HEIGHT+LABEL_MARGINS)];
    _titleLabel.textColor = _lineColor;
    _titleLabel.font = [XXFont fontWithName:@"HelveticaNeue" size:TITLE_HEIGHT];
    [self addSubview:_titleLabel];
    _subtitleLabel = [[XXLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, TITLE_HEIGHT)];
    _subtitleLabel.textColor = _lineColor;
    _subtitleLabel.font = [XXFont fontWithName:@"HelveticaNeue-Italic" size:TITLE_HEIGHT-10];
    [self addSubview:_subtitleLabel];
#if TARGET_OS_IPHONE
    _topDim.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"Placeholder";
    _subtitleLabel.textAlignment = NSTextAlignmentCenter;
#else
    [_topDim setAlignment:NSCenterTextAlignment];
    [_topDim setEditable:NO];
    [_topDim setBordered:NO];
    _topDim.drawsBackground = NO;
    [_leftDim setEditable:NO];
    [_leftDim setBordered:NO];
    _leftDim.drawsBackground = NO;
    [_titleLabel setAlignment:NSCenterTextAlignment];
    [_titleLabel setEditable:NO];
    [_titleLabel setBordered:NO];
    _titleLabel.stringValue = @"Placeholder";
    _titleLabel.drawsBackground = NO;
    [_subtitleLabel setAlignment:NSCenterTextAlignment];
    [_subtitleLabel setEditable:NO];
    [_subtitleLabel setBordered:NO];
    _subtitleLabel.drawsBackground = NO;
    [self setNeedsLayout:YES];
#endif
}

- (void)setDimensionInset:(float)dimensionInset {
    _dimensionInset = dimensionInset;
#if TARGET_OS_IPHONE
    [self setNeedsLayout];
#else
    [self setNeedsLayout:YES];
#endif
}

#if TARGET_OS_IPHONE
- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSInteger dimInset = MIN(width, height) * _dimensionInset;
    _topDim.frame = CGRectMake(0, dimInset, width, DIM_HEIGHT);
    _topDim.text = [NSString stringWithFormat:@"%.f", width];
    _leftDim.frame = CGRectMake(dimInset+4, (height+DIM_HEIGHT)/2, width-dimInset-4, DIM_HEIGHT);
    _leftDim.text = [NSString stringWithFormat:@"%.f", height];
    _titleLabel.frame = CGRectMake(0, height*.3, width, TITLE_HEIGHT+LABEL_MARGINS);
    _subtitleLabel.frame = CGRectMake(0, height*.6, width, TITLE_HEIGHT);
    [self setNeedsDisplay];
}
#else
- (void)resizeSubviewsWithOldSize:(NSSize)oldSize {
    [super resizeSubviewsWithOldSize:oldSize];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSInteger dimInset = MIN(width, height) * _dimensionInset;
    _topDim.frame = CGRectMake(0, dimInset, width, DIM_HEIGHT);
    _topDim.stringValue = [NSString stringWithFormat:@"%.f", width];
    _leftDim.frame = CGRectMake(dimInset+4, (height+DIM_HEIGHT)/2, width-dimInset-4, DIM_HEIGHT);
    _leftDim.stringValue = [NSString stringWithFormat:@"%.f", height];
    _titleLabel.frame = CGRectMake(0, height*.3, width, TITLE_HEIGHT+LABEL_MARGINS);
    _titleLabel.backgroundColor = [NSColor clearColor];
    _subtitleLabel.frame = CGRectMake(0, height*.6, width, TITLE_HEIGHT);
}

- (BOOL)isFlipped {
    return YES;
}
#endif


- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
#if TARGET_OS_IPHONE
	CGContextRef ctx = UIGraphicsGetCurrentContext();
#else
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
#endif
    CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
    CGContextFillRect(ctx, rect);
    
    CGContextSetFillColorWithColor(ctx, [_lineColor colorWithAlphaComponent:0.1].CGColor);
    for (CGFloat x=0.25;x<width;x+=25) {
        CGContextFillRect(ctx, CGRectMake(x, 0, 0.5f, height));
    }
    for (CGFloat y=0;y<height;y+=25) {
        CGContextFillRect(ctx, CGRectMake(0, y, width, 0.5f));
    }
    CGContextSetFillColorWithColor(ctx, [_lineColor colorWithAlphaComponent:0.15].CGColor);
    for (CGFloat x=0.25;x<width;x+=50) {
        CGContextFillRect(ctx, CGRectMake(x, 0, 0.5f, height));
    }
    for (CGFloat y=0;y<height;y+=50) {
        CGContextFillRect(ctx, CGRectMake(0, y, width, 0.5f));
    }
    CGContextSetFillColorWithColor(ctx, [_lineColor colorWithAlphaComponent:0.3].CGColor);
    for (CGFloat x=0.25;x<width;x+=100) {
        CGContextFillRect(ctx, CGRectMake(x, 0, 0.5f, height));
    }
    for (CGFloat y=0;y<height;y+=100) {
        CGContextFillRect(ctx, CGRectMake(0, y, width, 0.5f));
    }
    
    CGContextSetShouldAntialias(ctx, YES);
    CGFloat dimInset = floorf(MIN(width, height) * _dimensionInset) + 0.5;
    CGFloat arrowDepth = 10;
    CGContextSetStrokeColorWithColor(ctx, _lineColor.CGColor);
    CGContextSetLineWidth(ctx, 1);
    
    // Horizontal line
    CGContextMoveToPoint(ctx, arrowDepth, dimInset-arrowDepth);
    CGContextAddLineToPoint(ctx, 0, dimInset);
    CGContextAddLineToPoint(ctx, arrowDepth, dimInset+arrowDepth);
    CGContextMoveToPoint(ctx, 0, dimInset);
    CGContextAddLineToPoint(ctx, width, dimInset);
    CGContextMoveToPoint(ctx, width-arrowDepth, dimInset-arrowDepth);
    CGContextAddLineToPoint(ctx, width, dimInset);
    CGContextAddLineToPoint(ctx, width-arrowDepth, dimInset+arrowDepth);
    
    // Vertical line
    CGContextMoveToPoint(ctx, dimInset-arrowDepth, arrowDepth);
    CGContextAddLineToPoint(ctx, dimInset, 0);
    CGContextAddLineToPoint(ctx, dimInset+arrowDepth, arrowDepth);
    CGContextMoveToPoint(ctx, dimInset, 0);
    CGContextAddLineToPoint(ctx, dimInset, height);
    CGContextMoveToPoint(ctx, dimInset-arrowDepth, height-arrowDepth);
    CGContextAddLineToPoint(ctx, dimInset, height);
    CGContextAddLineToPoint(ctx, dimInset+arrowDepth, height-arrowDepth);
    
    CGContextStrokePath(ctx);
}

@end
