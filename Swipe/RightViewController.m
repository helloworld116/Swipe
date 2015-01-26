//
//  RightViewController.m
//  Swipe
//
//  Created by sdzg on 15-1-26.
//  Copyright (c) 2015年 itouchco.com. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  //    self.
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(barButtonAction:)];
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

- (void)barButtonAction:(id)sender {
  [self dismissViewControllerAnimated:YES
                           completion:^{

                           }];
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}
@end
