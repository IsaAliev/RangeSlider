//
//  ViewController.m
//  CustomSlider
//
//  Created by user on 31.12.16.
//  Copyright © 2016 I&N. All rights reserved.
//

#import "ViewController.h"
#import "IARangeSlider.h"

@interface ViewController ()
@property (strong, nonatomic) IARangeSlider* rangeSlider;
@property (strong, nonatomic) UILabel* label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IARangeSlider* rangeSlider = [[IARangeSlider alloc] initWithFrame:CGRectZero];
    rangeSlider.minimumValue = 0;
    rangeSlider.maximumValue = 100;
    rangeSlider.upperValue = 50;
    
    [self.view addSubview:rangeSlider];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+self.topLayoutGuide.length+50, 300, 40)];
    [label setFont:[UIFont systemFontOfSize:16.f]];
    [label setBackgroundColor:[UIColor greenColor]];
    [label setTextColor:[UIColor blackColor]];
    
    [self.view addSubview:label];
    
    self.label = label;
    
    self.rangeSlider  = rangeSlider;
    
    [self.rangeSlider addTarget:self action:@selector(rangeSliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)rangeSliderValueDidChange:(IARangeSlider*)rangeSlider{
    NSLog(@"RANGE : (%f, %f)", rangeSlider.lowerValue, rangeSlider.upperValue);
    
    [_label setText:[NSString stringWithFormat:@"RANGE : (%.02f, %.02f)", rangeSlider.lowerValue, rangeSlider.upperValue]];
}

-(void)viewDidLayoutSubviews{
    CGFloat margin = 20.f;
    CGFloat width = self.view.bounds.size.width - 2*margin;
    [self.rangeSlider setFrame:CGRectMake(margin, margin+self.topLayoutGuide.length, width, 31.f)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
