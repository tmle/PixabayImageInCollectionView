//
//  VideoCollectionViewController.h
//  AFNetworking-Nov2-2016
//
//  Created by Thinh Le on 2016-12-28.
//  Copyright © 2016 Lac Viet Inc. All rights reserved.
// 

#import <UIKit/UIKit.h>
#import "Restkit/Restkit.h"
#import "ImageInfo.h"

@interface VideoCollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSArray *imageProfiles;
@property (nonatomic, strong) NSMutableArray *imageArray;

@end
