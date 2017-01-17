//
//  ViewController.m
//  LazyImageDownloader
//
//  Created by Jyoti Karuna Nayak on 1/10/17.
//  Copyright © 2017 Sabita Rani Samal. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController ()
{
    NSMutableArray* arrayImageUrl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrayImageUrl  = [NSMutableArray arrayWithObjects: @"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png",
                      nil];
    
    for (int i=0; i<100; i++) {
        [arrayImageUrl addObject:[NSString stringWithFormat:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage%03d.jpg", i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayImageUrl.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    NSString* cellIdentifier = @"cell";
    
    UITableViewCell*  cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Image ..%lu",(unsigned long)indexPath.row];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
   // [cell.imageView sd_setImageWithURL:[NSURL URLWithString:arrayImageUrl[indexPath.row]]];
    
  [cell.imageView sd_setImageWithURL:[NSURL URLWithString:arrayImageUrl[indexPath.row]]placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
     
    return cell;

}
@end
