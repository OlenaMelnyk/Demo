//
//  DemoCollectionViewCell.h
//  Yello
//
//  Created by Olena Melnyk on 10/1/15.
//  Copyright © 2015 Drive Yello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *demoMessage;
@property (weak, nonatomic) IBOutlet UILabel *demoDescription;
@property (weak, nonatomic) IBOutlet UIImageView *demoImage;

@end
