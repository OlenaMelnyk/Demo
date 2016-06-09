//
//  DemoCollectionViewController.m
//  Yello
//
//  Created by Olena Melnyk on 10/1/15.
//  Copyright (c) 2015 Drive Yello. All rights reserved.
//

#import "DemoCollectionViewController.h"
#import "DemoCollectionViewCell.h"
#import "PageControl.h"

static NSString* const kDemoMessagesKey = @"messages";
static NSString* const kDemoDescriptionKey = @"descriptions";
static NSString* const kDemoImagesKey = @"images";

@interface DemoCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *demoCollectionView;
@property (weak, nonatomic) IBOutlet PageControl *pageControl;

@property (nonatomic, strong) NSArray* demoImages;
@property (nonatomic, strong) NSArray* demoMessages;
@property (nonatomic, strong) NSArray* demoDescriptions;

@end

@implementation DemoCollectionViewController

static NSString * const reuseIdentifier = @"DemoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"plist"];
    NSDictionary *demoInfo = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    _demoMessages = demoInfo[kDemoMessagesKey];
    _demoDescriptions = demoInfo[kDemoDescriptionKey];
    _demoImages = demoInfo[kDemoImagesKey];

    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.numberOfPages = [self.demoMessages count];
    self.pageControl.indicatorDiameter = 13;
    self.pageControl.indicatorSpace = 13;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)goBack:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.demoMessages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.demoMessage.text = self.demoMessages[indexPath.row];
    cell.demoDescription.text = self.demoDescriptions[indexPath.row];
    cell.demoImage.image = [UIImage imageNamed:self.demoImages[indexPath.row]];
    self.pageControl.currentPage = indexPath.row;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.bounds.size;
}

@end
