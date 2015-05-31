# SUClipImage

- (void)viewDidAppear:(BOOL)animated
{
UIImage *image = [UIImage imageNamed:@"1"];
self.clip = [[SUClipImage alloc]initWithOriginalImageView:self.image originalImage:image];
self.clip.options.shotRadius = 40;

[self.clip showMaskLayer];
}


- (IBAction)takePicture:(id)sender {
UIImage *newImage = [self.clip takePicture];
UIViewController *vc = [[UIViewController alloc] init];
UIImageView *imagev = [[UIImageView alloc]initWithImage:newImage];
imagev.frame = CGRectMake(10, 200, newImage.size.width, newImage.size.height);
[vc.view addSubview:imagev];

[self.navigationController pushViewController:vc animated:YES];
}