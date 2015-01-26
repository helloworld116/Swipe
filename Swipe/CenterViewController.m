//
//  CenterViewController.m
//  Swipe
//
//  Created by sdzg on 15-1-26.
//  Copyright (c) 2015年 itouchco.com. All rights reserved.
//

#import "CenterViewController.h"
#import "AppDelegate.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  UIPanGestureRecognizer *panGeseture = [[UIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(panGestureResponed:)];
  [self.view addGestureRecognizer:panGeseture];

  //  UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]
  //      initWithTarget:self
  //              action:@selector(swipeGestureHandle:)];
  //  [self.view addGestureRecognizer:swipeGesture];

  UIPanGestureRecognizer *navigationBarPanGesture =
      [[UIPanGestureRecognizer alloc]
          initWithTarget:self
                  action:@selector(navPanGestureHandle:)];
  [self.navigationController.navigationBar
      addGestureRecognizer:navigationBarPanGesture];

  // Nav
  UIBarButtonItem *item1 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮1"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  UIBarButtonItem *item2 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮2"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  UIBarButtonItem *item3 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮3"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  UIBarButtonItem *item4 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮3"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  UIBarButtonItem *item5 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮3"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  UIBarButtonItem *item6 =
      [[UIBarButtonItem alloc] initWithTitle:@"按钮3"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  //  self.navigationController.navigationBar.items = @[ item1, item2, item3 ];
  //  self.navigationItem.rightBarButtonItems =
  //      @[ item1, item2, item3, item4, item5, item6 ];

  UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(50, 0, 220, 44)];
  titleView.layer.borderColor = [UIColor redColor].CGColor;
  titleView.layer.borderWidth = 0.5f;
  UIScrollView *scrollView =
      [[UIScrollView alloc] initWithFrame:titleView.bounds];
  CGFloat totalWidth = 0.f;
  scrollView.showsHorizontalScrollIndicator = NO;
  for (int i = 1; i <= 6; i++) {
    NSString *title = [NSString stringWithFormat:@"按钮%d", i];
    CGSize titleSize = [title sizeWithAttributes:@{
      NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:17]
    }];
    totalWidth += (titleSize.width + 20);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
    btn.frame = CGRectMake(0 + (titleSize.width + 10) * (i - 1), 0,
                           titleSize.width + 20, 44);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self
                  action:@selector(barButtonAction:)
        forControlEvents:UIControlEventTouchUpInside];

    [scrollView addSubview:btn];
  }
  scrollView.contentSize = CGSizeMake(totalWidth, scrollView.frame.size.height);
  [titleView addSubview:scrollView];
  self.navigationItem.titleView = titleView;

  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"顶部"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"右部"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];

  //  self.scrollView.contentSize =
  //      CGSizeMake(2 * 320, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)barButtonAction:(id)sender {
  NSLog(@"sender is %@", sender);
  AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
  if (self.navigationItem.rightBarButtonItem == sender) {
    self.navigationController.modalTransitionStyle =
        UIModalTransitionStyleCrossDissolve;
    //    self.modalPresentationStyle = UIModalPresentationPopover;
    [self.navigationController presentViewController:app.rightController
                                            animated:YES
                                          completion:^{

                                          }];
  } else if (self.navigationItem.leftBarButtonItem == sender) {
    [self presentViewController:app.topController
                       animated:YES
                     completion:^{

                     }];
  }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)panGestureResponed:(UIPanGestureRecognizer *)panGesture {
  NSLog(@"state is %d", panGesture.state);
  NSLog(@"translationInView is %@",
        NSStringFromCGPoint([panGesture translationInView:self.view]));
  NSLog(@"velocityInView is %@",
        NSStringFromCGPoint([panGesture velocityInView:self.view]));
}

- (void)navPanGestureHandle:(UIPanGestureRecognizer *)panGesture {
  NSLog(@"nav state is %d", panGesture.state);
  NSLog(@"nav translationInView is %@",
        NSStringFromCGPoint([panGesture translationInView:self.view]));
  NSLog(@"nav velocityInView is %@",
        NSStringFromCGPoint([panGesture velocityInView:self.view]));
}

- (void)swipeGestureHandle:(UISwipeGestureRecognizer *)recognizer {
  //    recognizer.state==UIGestureRecognizerStateChanged
  NSLog(@".... recognizer ");
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end
