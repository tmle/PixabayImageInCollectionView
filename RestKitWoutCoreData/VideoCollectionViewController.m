//
//  VideoCollectionViewController.m
//  AFNetworking-Nov2-2016
//
//  Created by Thinh Le on 2016-12-28.
//  Copyright © 2016 Lac Viet Inc. All rights reserved.
//

#import "VideoCollectionViewController.h"
#import "VideoCollectionViewCell.h"
//#import "VideoTableViewController.h"

@interface VideoCollectionViewController ()

@end

@implementation VideoCollectionViewController

static NSString * const reuseIdentifier = @"VideoCollectionCell";
NSString *_videoSeriesTitle;
NSString *_videoPlayListId;
NSString *_videoListAuthor;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Kids";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:102.0/255.0 green:134.0/255.0 blue:203.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //[[UITabBar appearance] setTintColor:[UIColor colorWithRed:102.0/255.0 green:134.0/255.0 blue:203.0/255.0 alpha:1.0]];
    
    // step 1
    RKObjectMapping* imageMapping = [RKObjectMapping mappingForClass:[ImageInfo class]];
    [imageMapping addAttributeMappingsFromDictionary:@{
                                                       @"imageHeight": @"imageHeight",
                                                       @"likes": @"likes",
                                                       @"favorites": @"favorites",
                                                       @"previewURL": @"previewURL",
                                                       @"tags" : @"tags",
                                                       }];
    //[actorMapping addAttributeMappingsFromArray:@[@"imageHeight", @"likes", @"favorites", @"previewURL"]];
    
    // step 2
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:imageMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"hits" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    // step 3
    NSURL *URL = [NSURL URLWithString:@"https://pixabay.com/api/?key=4625860-5b902179fd09a75fec0823ea8&q=red+flowers&image_type=photo&per_page=200"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        //RKLogInfo(@"Load collection of Actors: Actor[0] = %@", mappingResult.array);
        self.imageProfiles = mappingResult.array;
        NSMutableArray *records = [[NSMutableArray array] init];
        for (int k=0; k<self.imageProfiles.count; k++) {
            ImageInfo *record = self.imageProfiles[k];
            
            //NSLog(@"previewURL = %@; likes = %@", record.previewURL, record.likes);
            //            record.recordName = product.productName;
            [records addObject:record];
            record = nil;
        }
        self.imageArray = records;
        [self.collectionView reloadData];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        RKLogError(@"Operation failed with error: %@", error);
    }];
    
    [objectRequestOperation start];
    
    // color definition
    //red [UIColor colorWithRed:197.0/255.0 green:69.0/255.0 blue:74.0/255.0 alpha:1.0];
    //yellow [UIColor colorWithRed:245.0/255.0 green:266.0/255.0 blue:105.0/255.0 alpha:1.0];
    // pink [UIColor colorWithRed:180.0/255.0 green:91.0/255.0 blue:144.0/255.0 alpha:1.0];
    //orange [UIColor colorWithRed:208.0/255.0 green:106.0/255.0 blue:71.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:40.0/255.0 green:71.0/255.0 blue:161.0/255.0 alpha:1.0]; // purple
    // acid green [UIColor colorWithRed:201.0/255.0 green:225.0/255.0 blue:74.0/255.0 alpha:1.0];
    // blue black [UIColor colorWithRed:47.0/255.0 green:57.0/255.0 blue:75.0/255.0 alpha:1.0];
    // orlando blue [UIColor colorWithRed:64.0/255.0 green:162.0/255.0 blue:209.0/255.0 alpha:1.0];
    // cathartic blue [UIColor colorWithRed:91.0/255.0 green:111.0/255.0 blue:123.0/255.0 alpha:1.0];
    // blood red [UIColor colorWithRed:166.0/255.0 green:56.0/255.0 blue:83.0/255.0 alpha:1.0];
    
    // turkist color palette 1
    //[UIColor colorWithRed:221.0/255.0 green:109.0/255.0 blue:61.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:153.0/255.0 green:98.0/255.0 blue:176.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:195.0/255.0 green:73.0/255.0 blue:42.0/255.0 alpha:1.0]; // orange
    //[UIColor colorWithRed:129.0/255.0 green:149.0/255.0 blue:125.0/255.0 alpha:1.0]; // greenist turquois
    //[UIColor colorWithRed:168.0/255.0 green:55.0/255.0 blue:59.0/255.0 alpha:1.0]; // purple
    //[UIColor colorWithRed:116.0/255.0 green:93.0/255.0 blue:172.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:102.0/255.0 green:134.0/255.0 blue:203.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:99.0/255.0 green:111.0/255.0 blue:176.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:227.0/255.0 green:203.0/255.0 blue:103.0/255.0 alpha:1.0]; // yellow
    //[UIColor colorWithRed:176.0/255.0 green:176.0/255.0 blue:65.0/255.0 alpha:1.0]; // green
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    //NSLog(@"seriestitles = %lu, thumbnails = %lu, playlistId = %lu, authors = %lu", (unsigned long)self.videoSeriesTitles.count, (unsigned long)self.videoThumbnails.count, (unsigned long)self.videoPlayListIds.count, (unsigned long)self.videoListAuthors.count);
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ImageInfo *tmp = self.imageArray[indexPath.row];

    cell.backgroundColor = [UIColor colorWithRed:153.0/255.0 green:98.0/255.0 blue:176.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:40.0/255.0 green:71.0/255.0 blue:161.0/255.0 alpha:1.0]; // purple
    //[UIColor colorWithRed:180.0/255.0 green:91.0/255.0 blue:144.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:64.0/255.0 green:162.0/255.0 blue:209.0/255.0 alpha:1.0];
    //[UIColor colorWithRed:197.0/255.0 green:69.0/255.0 blue:74.0/255.0 alpha:1.0];
    
    cell.textLabel.text = tmp.tags; //[tmp.previewURL absoluteString];
//    cell.textLabel.text = [self.videoSeriesTitles objectAtIndex:indexPath.item];  //@"test";
//    NSString *imageName = [self.videoThumbnails objectAtIndex:indexPath.item];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:tmp.previewURL]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    _videoSeriesTitle = [self.videoSeriesTitles objectAtIndex:indexPath.item];
//    _videoPlayListId = [self.videoPlayListIds objectAtIndex:indexPath.item];
//    _videoListAuthor = [self.videoListAuthors objectAtIndex:indexPath.item];
//    [self performSegueWithIdentifier:@"ShowVideoTableViewController" sender:self];
}

 #pragma mark - Navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"ShowVideoTableViewController"]) {
//        VideoTableViewController * videoTableViewController = (VideoTableViewController*)segue.destinationViewController;
//        videoTableViewController.videoSeriesTitle = _videoSeriesTitle;
//        videoTableViewController.videoPlayListId = _videoPlayListId;
//        videoTableViewController.videoListAuthor = _videoListAuthor;
//    }
//}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
