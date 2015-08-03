//
//  mosaicGridLayout.m
//  mosaicGridVideoViewer
//
//  Created by Алексей Саечников on 13.07.15.
//  Copyright (c) 2015 aSaechnikov. All rights reserved.
//

#import "mosaicGridLayout.h"

@interface mosaicGridLayout ()
@property (nonatomic, strong) NSMutableDictionary *layoutAttributes;
@property (nonatomic) CGSize contentSize;
@end

@implementation mosaicGridLayout

-(void)prepareLayout {
    [super prepareLayout];
    
    NSInteger numberOfElements = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger currentElement = 0; currentElement < numberOfElements; currentElement++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentElement inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = [self frameForElementAtIndexPath:indexPath];
        self.layoutAttributes[indexPath] = attributes;
    }
}

- (CGRect) frameForElementAtIndexPath:(NSIndexPath*)indexPath {
    CGFloat bigCellSide = self.collectionView.bounds.size.width* 2/3;
    CGFloat smallCellSide = self.collectionView.bounds.size.width/3;
    
    NSInteger rowNumber = indexPath.row / 3;
    NSInteger collNumber = indexPath.row % 3;
    
    NSInteger chNumb = rowNumber % 2;
    
    CGRect frame;
    if (chNumb) {
        frame = CGRectMake(
                           (collNumber == 0 ? 0 : bigCellSide) + 5,
                           (collNumber == 2 ? bigCellSide*rowNumber + smallCellSide : bigCellSide*rowNumber) + 5,
                           (collNumber == 0 ? bigCellSide : smallCellSide) -10,
                           (collNumber == 0 ? bigCellSide : smallCellSide) -10
                           );
    }
    else {
        frame = CGRectMake(
                           (collNumber == 2 ? smallCellSide : 0) + 5,
                           (collNumber == 1 ? bigCellSide*rowNumber + smallCellSide : bigCellSide*rowNumber) + 5,
                           (collNumber == 2 ? bigCellSide : smallCellSide) -10,
                           (collNumber == 2 ? bigCellSide : smallCellSide) -10
                           );
    }
    
    return frame;
}

-(CGSize)collectionViewContentSize {
    NSInteger itemsCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat bigCellSide = self.collectionView.bounds.size.width* 2/3;
    
    NSInteger rowCount = itemsCount / 3;
    NSInteger lastRowItemsCount = itemsCount % 3;
    
    CGFloat height = rowCount*bigCellSide;
    if (lastRowItemsCount) {
        height = height + bigCellSide;
    }
    
    return CGSizeMake(self.collectionView.bounds.size.width, height);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.layoutAttributes[indexPath];
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributesInRect = [NSMutableArray array];
    
    [self.layoutAttributes enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath,
                                                               UICollectionViewLayoutAttributes *attributes, BOOL *stop) {
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [attributesInRect addObject:attributes];
        }
    }];
    return attributesInRect;
}

#pragma mark - getters, setters
-(NSMutableDictionary *)layoutAttributes {
    if (!_layoutAttributes){
        _layoutAttributes = [NSMutableDictionary dictionary];
    }
    return _layoutAttributes;
}

@end
