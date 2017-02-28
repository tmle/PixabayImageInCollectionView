//
//  ImageInfo.h
//  RestKitWoutCoreData
//
//  Created by Thinh Le on 2017-02-24.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfo : NSObject 

@property (strong, nonatomic) NSNumber *imageHeight;
@property (strong, nonatomic) NSNumber *likes;
@property (strong, nonatomic) NSNumber *favorites;
@property (strong, nonatomic) NSURL *previewURL;
@property (strong, nonatomic) NSString *tags;

@end
