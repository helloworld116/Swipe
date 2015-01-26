//
//  BaseViewController.m
//  Swipe
//
//  Created by sdzg on 15-1-26.
//  Copyright (c) 2015年 itouchco.com. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  //  UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]
  //      initWithTarget:self
  //              action:@selector(swipeGestureResponed:)];
  //  [self.view addGestureRecognizer:swipeGesture];

  UIPanGestureRecognizer *panGeseture = [[UIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(panGestureResponed:)];
  [self.view addGestureRecognizer:panGeseture];

  UIPanGestureRecognizer *navigationBarPanGesture =
      [[UIPanGestureRecognizer alloc]
          initWithTarget:self
                  action:@selector(navPanGestureHandle:)];
  [self.navigationController.navigationBar
      addGestureRecognizer:navigationBarPanGesture];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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

- (void)swipeGestureResponed:(UISwipeGestureRecognizer *)swipeGesture {
  NSLog(@"direction is %d", swipeGesture.direction);
}

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
  //    panGesture.state
  UINavigationController *topNav =
      [self.storyboard instantiateViewControllerWithIdentifier:@"top"];
  [self.storyboard instantiateViewControllerWithIdentifier:@"center"];
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}
@end
