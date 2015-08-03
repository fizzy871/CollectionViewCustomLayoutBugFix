//
//  ImageCollectionViewCell.m
//  mosaicGridVideoViewer
//
//  Created by Алексей Саечников on 13.07.15.
//  Copyright (c) 2015 aSaechnikov. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@interface ImageCollectionViewCell ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation ImageCollectionViewCell
-(void)prepareForReuse {
    self.imageView.image = nil;
}
@end
