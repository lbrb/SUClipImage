//
//  ViewController.m
//  demo
//
//  Created by liangbin on 15/5/31.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "ViewController.h"
#import "SUClipImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)takePicture:(id)sender;

@property (strong, nonatomic) SUClipImage *clip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    UIImage *image = [UIImage imageNamed:@"1"];
    self.clip = [[SUClipImage alloc]initWithOriginalImageView:self.image originalImage:image];
    self.clip.options.shotRadius = 40;
    
    [self.clip showMaskLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender {
    UIImage *newImage = [self.clip takePicture];
    UIViewController *vc = [[UIViewController alloc] init];
    UIImageView *imagev = [[UIImageView alloc]initWithImage:newImage];
    imagev.frame = CGRectMake(10, 200, newImage.size.width, newImage.size.height);
    [vc.view addSubview:imagev];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
