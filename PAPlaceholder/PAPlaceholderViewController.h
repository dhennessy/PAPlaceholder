//
//  PAPlaceholderViewController.h
//
//  Created by Denis Hennessy on 13/12/2013.
//  Copyright (c) 2013 Denis Hennessy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPlaceholderView.h"

@interface PAPlaceholderViewController : UIViewController {
    PAPlaceholderView *_placeholderView;
}

@property (strong, nonatomic) NSString *subtitle;

@end
