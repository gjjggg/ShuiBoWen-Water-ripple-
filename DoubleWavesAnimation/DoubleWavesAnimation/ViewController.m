//
//  ViewController.m
//  DoubleWavesAnimation
//


#import "ViewController.h"

#import "FirstWaves.h"
#import "SecondWaves.h"
#import "MJRefresh.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView * scr;
}
@property (nonatomic,strong)FirstWaves *firstWare;

@property (nonatomic,strong)SecondWaves *secondWare;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor =[UIColor colorWithRed:253/255.0 green:131/255.0 blue:81/255.0 alpha:1.0];
    self.view.backgroundColor =[UIColor whiteColor];
//     scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
//    scr.delegate = self;
//   scr.backgroundColor = [UIColor colorWithRed:252/255.0 green:81/255.0 blue:31/255.0 alpha:1.0];
//    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshHeaderAction)];
//    
////    [header setTitle:@"点击或上拉加载更多" forState:MJRefreshStateRefreshing];
////    [header setTitle:@"点击或上拉加载更多" forState: MJRefreshStatePulling];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
//    header.arrowView.hidden = YES;
//    header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
//    scr.mj_header = header;
    
   // [self.view addSubview:scr];
    
    //第一个波浪
//    self.firstWare = [[FirstWaves alloc]initWithFrame:CGRectMake(0, - self.view.frame.size.height, self.view.frame.size.width,self.view.frame.size.height+  self.view.frame.size.height+30)];
    self.firstWare = [[FirstWaves alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height/4)];
    //self.firstWare.backgroundColor = [UIColor yellowColor];
        //设置波浪流动速度
       self.firstWare.wavesSpeed = 0.02;
        //设置振幅
        self.firstWare.waveA = 6;
        //设置周期
        self.firstWare.waveW = 0.5/35.0;

    self.firstWare.alpha=0.8;
    
    //第二个波浪
//    self.secondWare = [[SecondWaves alloc]initWithFrame:CGRectMake(0,- self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height+self.view.frame.size.height+30)];
    self.secondWare = [[SecondWaves alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height/4)];
    //设置波浪流动速度
    self.secondWare.wavesSpeed = 0.03;
    //设置振幅
    self.secondWare.waveA =6;
    //设置周期
    self.secondWare.waveW = 0.5/30.0;
    self.secondWare.alpha=0.8;
    
  [self.view addSubview:self.firstWare];
    
   [self.view addSubview:self.secondWare];
    

    //是否有震荡效果
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
}


- (void)animateWave{
    

    [UIView animateWithDuration:1 animations:^{
        
        self.firstWare.transform = CGAffineTransformMakeTranslation(0, 20);
        
        self.secondWare.transform = CGAffineTransformMakeTranslation(0, 20);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            
            self.firstWare.transform = CGAffineTransformMakeTranslation(0, 0);
            
            self.secondWare.transform = CGAffineTransformMakeTranslation(0, 0);
            
        } completion:nil];
    
    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%lf",offsetY);
    NSLog(@"  chhh   %lf",offsetY/50);
    
    NSLog(@" fdgsgvfsd");
    if (offsetY<0) {
        if(offsetY>-70){
        //设置波浪流动速度
        self.firstWare.wavesSpeed = 0.02;
        //设置振幅
        self.firstWare.waveA = 5+offsetY/3.5;
        //设置周期
        self.firstWare.waveW = 0.5/20.0;
        
        //设置波浪流动速度
        self.secondWare.wavesSpeed = 0.02;
        //设置振幅
//        self.secondWare.waveA = 17;
         self.secondWare.waveA = 5+offsetY/3.5;
        //设置周期
        self.secondWare.waveW = 0.5/20;
     }

    }
    else{
        //设置波浪流动速度
        self.firstWare.wavesSpeed = 0.02;
        //设置振幅
        self.firstWare.waveA = 5;
        //设置周期
        self.firstWare.waveW = 0.5/20.0;

        //设置波浪流动速度
        self.secondWare.wavesSpeed = 0.02;
        //设置振幅
        self.secondWare.waveA =7;
        //设置周期
        self.secondWare.waveW = 0.5/20.0;
    
    }
}

//刷新
-(void)rootRefreshHeaderAction{
    [scr.mj_header endRefreshing];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
