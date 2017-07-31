

#import "HeadView.h"
@interface HeadView()<UIScrollViewDelegate>
@property(nonatomic,assign)CGFloat viewW;//scrollView的宽
@property(nonatomic,assign)CGFloat viewH;//scrollView的高
@property(nonatomic,assign)NSUInteger num;//总页数
@property(nonatomic,weak)UIPageControl *page;

@end
@implementation HeadView
//初始化方法，生成view
-(instancetype)initWithFrame:(CGRect)frame Arr:(NSArray *)arr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        self.viewW=self.bounds.size.width;
        self.viewH=self.bounds.size.height;
        UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _viewW, _viewH)];
        self.scrollView=scrollView;
        [self addSubview:scrollView];
        scrollView.delegate=self;
        [self CreatImageView:arr];
        scrollView.pagingEnabled=YES;
        scrollView.contentSize=CGSizeMake(_viewW*arr.count, 0);
        scrollView.bounces=NO;
        scrollView.showsHorizontalScrollIndicator=NO;
        self.num=arr.count;
        UIPageControl *page=[[UIPageControl alloc]initWithFrame:CGRectMake((_viewW-100)*.5, _viewH-20, 100, 30)];
        page.numberOfPages=_num;
        page.currentPage=0;
        page.pageIndicatorTintColor=RGBColor(222, 222, 222);
        page.currentPageIndicatorTintColor=[UIColor lightGrayColor];
        self.page=page;
        [self addSubview:page];
        NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    }
    return self;
}


//创建scrollView中的图片
-(void)CreatImageView:(NSArray *)arr{
    for(int i=0;i<arr.count;i++){
        CGFloat x=i*_viewW;
        UIImage *img=[UIImage imageNamed:arr[i]];
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(x, 0, _viewW, _viewH)];
        imgView.image=img;
        [self.scrollView addSubview:imgView];
    }
}
//自动切换page
-(void)changePage{
    NSInteger num=self.page.currentPage;
    num++;
    if(num>=_num)
        num=0;
    self.page.currentPage=num;
    CGPoint offset=CGPointMake(num*_viewW, 0);
    self.scrollView.contentOffset=offset;
}
//拖动图片切换page
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset=scrollView.contentOffset;
    NSUInteger page=(offset.x+_viewW*.5)/_viewW;
    self.page.currentPage=page;
}
@end
