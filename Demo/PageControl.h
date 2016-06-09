//
//  PageControl.h
//  Yello
//
//  Created by Olena Melnyk on 10/1/15.
//  Copyright © 2015 Drive Yello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControl : UIView

@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

@property (nonatomic) CGFloat indicatorDiameter; // default is 7
@property (nonatomic) CGFloat indicatorSpace; // default is 7

@end

