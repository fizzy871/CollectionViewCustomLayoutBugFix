//
//  ViewController.m
//  collViewBugTest
//
//  Created by Алексей Саечников on 03.08.15.
//  Copyright (c) 2015 aSaechnikov. All rights reserved.
//

#import "ViewController.h"
#import "ImagesCollectionViewController.h"

@interface ViewController ()
@property (nonatomic, weak) ImagesCollectionViewController *collViewCon;
@end

@implementation ViewController

- (IBAction)removeCell:(id)sender {
    NSArray *array = self.collViewCon.dataArray;
    self.collViewCon.dataArray = [array subarrayWithRange:NSMakeRange(0, array.count-1)];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"collView"]) {
        self.collViewCon = segue.destinationViewController;
    }
}

@end
