//
//  RCTPhotoAlbumsNameList.m
//  RCTPhotoAlbumsNameList
//
//  Created by Muhammad Furqan on 13/11/2017.
//  Copyright © 2017 Muhammad Furqan. All rights reserved.
//

#import "RCTPhotoAlbumsNameList.h"
#import <React/RCTLog.h>
#import <Photos/Photos.h>

@implementation RCTPhotoAlbumsNameList

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getSmartAlbumsName:(RCTResponseSenderBlock)callback)
{
    //RCTLogInfo(@"getNames method called");
    
    PHFetchResult *fetchedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    
    int i;
    NSMutableArray *albums = [NSMutableArray array];
    
    NSUInteger count;
    count = [fetchedAlbums count];
    
    for (i = 0; i < count; i++) {
        PHAssetCollection *album = fetchedAlbums[i];
        [albums addObject:album.localizedTitle];
    }
    
    NSArray *returnArray = [NSArray arrayWithArray:albums];
    
    callback(@[[NSNull null], returnArray]);
}

RCT_EXPORT_METHOD(getUserAlbumsName:(RCTResponseSenderBlock)callback)
{
    //RCTLogInfo(@"getNames method called");
    
    PHFetchResult *fetchedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    
    int i;
    NSMutableArray *albums = [NSMutableArray array];
    
    NSUInteger count;
    count = [fetchedAlbums count];
    
    for (i = 0; i < count; i++) {
        PHAssetCollection *album = fetchedAlbums[i];
        [albums addObject:album.localizedTitle];
    }
    
    NSArray *returnArray = [NSArray arrayWithArray:albums];
    
    callback(@[[NSNull null], returnArray]);
}

@end
