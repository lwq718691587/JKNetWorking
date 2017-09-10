//
//  BGUploadImagesRequest.h
//  Pods
//
//  Created by 刘伟强 on 2017/9/10.
//
//

#import "BGNetworkRequest.h"
#import "AFNetworking.h"

@interface BGUploadImagesRequest : BGNetworkRequest

/**
 *  初始化请求
 *
 *  @param images 图片
 *
 *  @return 返回请求对象
 */
- (instancetype _Nonnull)initWithImages:(NSArray * _Nonnull)images;


@property (strong, nonatomic,readonly) NSArray * _Nonnull images;
/**
 *  上传数据的键值，默认为"fileUpload"，不能为空
 */
@property (nonatomic, strong) NSString * _Nonnull uploadKey;


/**
 *  图片类型  默认 为 @"image/jpeg"  
 */
@property (nonatomic, strong) NSString * _Nonnull mimeType;

/**
 压缩系数 默认为1
 */
@property (nonatomic) CGFloat compressionQuality;

- (void)sendRequestWithProgress:(nullable void (^)(NSProgress * _Nonnull uploadProgress)) uploadProgress
                        success:(BGSuccessCompletionBlock _Nullable)successCompletionBlock
                businessFailure:(BGBusinessFailureBlock _Nullable)businessFailureBlock
                 networkFailure:(BGNetworkFailureBlock _Nullable)networkFailureBlock;

@end
