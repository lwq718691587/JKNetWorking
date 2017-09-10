//
//  BGUploadImagesRequest.m
//  Pods
//
//  Created by 刘伟强 on 2017/9/10.
//
//

#import "BGUploadImagesRequest.h"
#import "BGNetworkManager.h"
@interface BGUploadImagesRequest ()

@property (strong, nonatomic) NSArray *images;

@end

@implementation BGUploadImagesRequest

- (instancetype _Nonnull)initWithImages:(NSArray * _Nonnull)images {
    if(self = [super init]) {
        self.images = images;
        self.uploadKey = @"fileUpload";
        self.mimeType = @"image/jpeg";
        self.compressionQuality = 1;
    }
    return self;
}

- (void)sendRequestWithSuccess:(BGSuccessCompletionBlock)successCompletionBlock businessFailure:(BGBusinessFailureBlock)businessFailureBlock networkFailure:(BGNetworkFailureBlock)networkFailureBlock {
    return [self sendRequestWithProgress:NULL success:successCompletionBlock businessFailure:businessFailureBlock networkFailure:networkFailureBlock];
}

- (void)sendRequestWithProgress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(BGSuccessCompletionBlock)successCompletionBlock businessFailure:(BGBusinessFailureBlock)businessFailureBlock networkFailure:(BGNetworkFailureBlock)networkFailureBlock {
    
    [[BGNetworkManager sharedManager] sendUploadImagesRequest:self progress:uploadProgress success:successCompletionBlock businessFailure:businessFailureBlock networkFailure:networkFailureBlock];

}


@end

