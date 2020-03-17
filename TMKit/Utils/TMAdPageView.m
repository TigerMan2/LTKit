//
//  TMAdPageView.m
//  TMKit
//
//  Created by Luther on 2019/10/10.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "TMAdPageView.h"

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

@interface TMAdPageView ()
@property (nonatomic, strong) UIImageView *adView;
@property (nonatomic, strong) UIButton *countBtn;
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@property (nonatomic, copy) TapBlock tapBlock;
@end

/** 广告展示时间 */
static int const showTime = 5;

@implementation TMAdPageView

- (NSTimer *)countTimer {
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}

- (instancetype)initWithFrame:(CGRect)frame tapBlock:(TapBlock)tapBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        
        //!< 1.广告图片
        _adView = [[UIImageView alloc] initWithFrame:frame];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        //!< 2.跳过按钮
        CGFloat btnWidth = 60;
        CGFloat btnHeight = 30;
        _countBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _countBtn.frame = CGRectMake(frame.size.width - btnWidth - 24, kTopHeight, btnWidth, btnHeight);
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",showTime] forState:UIControlStateNormal];
        [_countBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_countBtn setBackgroundColor:[UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:0.6]];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_adView];
        [self addSubview:_countBtn];
        
        //!< 判断沙河中是否存在图片，存在则直接展示
        NSString *filePath = [self getFilePathWithImageName:[[NSUserDefaults standardUserDefaults] objectForKey:adImageName]];
        BOOL isExist = [self isFileExistWithFilePath:filePath];
        if (isExist) {
            [self setFilePath:filePath];
            self.tapBlock = tapBlock;
            [self show];
        }
        
        [self getAdvertisingImage]; //!< 不论本地是否有广告，都请求更新
        
    }
    return self;
}

- (void)pushToAd {
    [self dismiss];
    if (self.tapBlock) {
        self.tapBlock();
    }
}

/// 定时器倒计时
- (void)countDown {
    _count--;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",_count] forState:UIControlStateNormal];
    if (_count <= 0) {
        [self dismiss];
    }
}

- (void)show {
    
    if (showTime <= 0) {
        return;
    }
    //!< 1.GCD
//    [self startGCDTimer];
    //!< 2.定时器
    [self startTimer];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)startTimer {
    _count = showTime;
    [[NSRunLoop currentRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}

/// GCD定时器
- (void)startGCDTimer {
    __block int timeOut = showTime;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut <= 0) { //!< 倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",timeOut] forState:UIControlStateNormal];
                timeOut --;
            });
        }
    });
    dispatch_resume(timer);
}

- (void)dismiss {
    [self.countTimer invalidate];
    self.countTimer = nil;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setFilePath:(NSString *)filePath {
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

/// 初始化广告页面
- (void)getAdvertisingImage {
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg"];
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    //!< 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist) {
        //!< 本地不存在该广告图片，则下载
        [self downloadAdImageWithImageUrl:imageUrl imageName:imageName];
    }
    
}

/// 下载新广告图片
/// @param imageUrl 广告图片链接
/// @param imageName 广告图片名称
- (void)downloadAdImageWithImageUrl:(NSString *)imageUrl imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName]; //!< 保存文件的名称
        
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) { //!< 保存成功
            NSLog(@"广告页保存成功!");
            [self deleteOldImage];
            [[NSUserDefaults standardUserDefaults] setValue:imageName forKey:adImageName];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //!< 如果有广告链接，将广告链接也保存下来
        } else {
            NSLog(@"广告页保存失败!");
        }
    });
}

/// 删除旧图片
- (void)deleteOldImage {
    NSString *imageName = [[NSUserDefaults standardUserDefaults] valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/// 判断文件是否存在
/// @param filePath 文件路径
- (BOOL)isFileExistWithFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = false;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/// 根据图片名拼接文件路径
/// @param imageName 图片名
- (NSString *)getFilePathWithImageName:(NSString *)imageName {
    if (imageName) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths firstObject] stringByAppendingPathComponent:imageName];
        return filePath;
    }
    return nil;
}

@end
