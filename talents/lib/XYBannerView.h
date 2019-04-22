//
//  XYBannerView.h
//  XYBannerView
//

#import <UIKit/UIKit.h>

@class XYBannerView;

@protocol XYBannerViewDelegate <NSObject>

@optional

/** 监听点击的图片和位置 */
- (void)bannerView:(XYBannerView *)banner didClickImageAtIndex:(NSInteger)index;


@end



@interface XYBannerView : UIView


/** 要展示图片数组 */
@property (nonatomic, strong) NSArray *imagesArr;
/** 要展示标题数组 */
@property (nonatomic, strong) NSArray *titlesArr;
/** 代理 */
@property (nonatomic, weak) id<XYBannerViewDelegate> delegate;


+ (instancetype)bannerView;








@end
