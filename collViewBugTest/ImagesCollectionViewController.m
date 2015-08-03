//
//  ImagesCollectionViewController.m
//  mosaicGridVideoViewer
//
//  Created by Алексей Саечников on 13.07.15.
//  Copyright (c) 2015 aSaechnikov. All rights reserved.
//

#import "ImagesCollectionViewController.h"
#import "mosaicGridLayout.h"
#import "ImageCollectionViewCell.h"

@interface ImagesCollectionViewController ()
@property (nonatomic, weak) IBOutlet mosaicGridLayout *mosaicGridLayout;
@end

@implementation ImagesCollectionViewController

@synthesize dataArray = _dataArray;

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    self.dataArray = @[@"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data", @"data"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:@"image-placeholder"];
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark - getters, setters
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.collectionView reloadData];
}

@end
