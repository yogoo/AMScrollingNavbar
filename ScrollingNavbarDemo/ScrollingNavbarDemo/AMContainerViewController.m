//
//  AMContainerViewController.m
//  ScrollingNavbarDemo
//
//  Created by Jerome Perrin on 16/03/15.
//  Copyright (c) 2015 Andrea Mazzini. All rights reserved.
//

#import "AMContainerViewController.h"
#import "UIViewController+ScrollingNavbar.h"
#import "AMTableViewController.h"

@interface AMContainerViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation AMContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0x184fa2)];
    
    [self setTitle:@"Container Views"];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav"]];
    
    // Get the child TableVC
    AMTableViewController *tableVC;
    for (id childController in self.childViewControllers) {
        if ([childController isKindOfClass:[AMTableViewController class]]) {
            tableVC = childController;
        }
    }
    
    // Just call this line to enable the scrolling navbar
    [self followScrollView:tableVC.tableView usingTopConstraint:self.topConstraint withDelay:65];
    [self setShouldScrollWhenContentFits:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self showNavBarAnimated:NO];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self showNavBarAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
