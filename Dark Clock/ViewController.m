//
//  ViewController.m
//  Dark Clock
//
//  Created by A656440 on 8/22/14.
//  Copyright (c) 2014 thehouck. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()
{
	NSDateFormatter *dateFormatter;

}
@property (weak, nonatomic) IBOutlet UILabel *uiClock;


@end

@implementation ViewController
            
- (void)viewDidLoad {
	[super viewDidLoad];
	dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat: @"MM-dd-yyyy\n hh:mm:ss a"];
	[[AFNetworkReachabilityManager sharedManager] startMonitoring];
	[self updateClock];

	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)updateClock {
	self.uiClock.text = [dateFormatter stringFromDate:[NSDate date]];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		self.uiClock.text = [dateFormatter stringFromDate:[NSDate date]];
		[self updateClock];
	});

}


@end
