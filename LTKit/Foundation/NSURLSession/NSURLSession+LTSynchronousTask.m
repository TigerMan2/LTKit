//
//  NSURLSession+LTSynchronousTask.m
//  LTKit
//
//  Created by Luther on 2019/10/11.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSURLSession+LTSynchronousTask.h"

@implementation NSURLSession (LTSynchronousTask)

#pragma mark    -   NSURLSessionDataTask
- (nullable NSData *)sendSynchronousDataTaskWithURL:(nonnull NSURL *)url
                                  returningResponse:(NSURLResponse *_Nullable *_Nullable)response
                                              error:(NSError * _Nullable *_Nullable)error {
    return [self sendSynchronousDataTaskWithRequest:[NSURLRequest requestWithURL:url] returningResponse:response error:error];
}

- (nullable NSData *)sendSynchronousDataTaskWithRequest:(nonnull NSURLRequest *)request
                                      returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                  error:(NSError * _Nullable __autoreleasing *_Nullable)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[self dataTaskWithRequest:request completionHandler:^(NSData * _Nullable taskData, NSURLResponse * _Nullable taskResponse, NSError * _Nullable taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return data;
}

#pragma mark    -   NSURLSessionDownloadTask
- (nullable NSURL *)sendSynchronousDownloadTaskWithURL:(nonnull NSURL *)url returningResponse:(NSURLResponse *_Nullable *_Nullable)response error:(NSError *_Nullable *_Nullable)error {
    return [self sendSynchronousDownloadTaskWithRequest:[NSURLRequest requestWithURL:url] returningResponse:response error:error];
}
- (nullable NSURL *)sendSynchronousDownloadTaskWithRequest:(nonnull NSURLRequest *)request
                                         returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                     error:(NSError *_Nullable __autoreleasing *_Nullable)error {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSURL *location = nil;
    [[self downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable taskLocation, NSURLResponse * _Nullable taskResponse, NSError * _Nullable taskError) {
        location = taskLocation;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return location;
}

#pragma mark    -   NSURLSessionUploadTask
- (nullable NSData *)sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request
                                                 fromFile:(nonnull NSURL *)fileURL
                                        returningResponse:(NSURLResponse *_Nullable*_Nullable)response
                                                    error:(NSError *_Nullable*_Nullable)error {
    return [self sendSynchronousUploadTaskWithRequest:request fromData:[NSData dataWithContentsOfURL:fileURL] returningResponse:response error:error];
}

- (nullable NSData *)sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request
                                                 fromData:(nonnull NSData *)bodyData
                                        returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                    error:(NSError *_Nullable __autoreleasing *_Nullable)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[self uploadTaskWithRequest:request fromData:bodyData completionHandler:^(NSData * _Nullable taskData, NSURLResponse * _Nullable taskResponse, NSError * _Nullable taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (taskError) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return data;
}

@end
