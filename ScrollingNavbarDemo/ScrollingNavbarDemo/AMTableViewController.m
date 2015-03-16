//
//  AMTableViewController.m
//  ScrollingNavbarDemo
//
//  Created by Andrea Mazzini on 09/11/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMTableViewController.h"
#import "UIViewController+ScrollingNavbar.h"

@interface AMTableViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSArray* data;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation AMTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = @[@"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content"];
    
    if (self.tabBarController) {
        [self.tabBarController.tabBar setHidden:YES];
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -44, 0);
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, -44, 0);
    }
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    // This enables the user to scroll down the navbar by tapping the status bar.
    //	[self performSelector:@selector(showNavbar) withObject:nil afterDelay:0.1];  // Use a delay if needed (pre iOS8)
    [self.parentViewController showNavbar];
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.parentViewController.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"AMTableViewController"] animated:YES];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    // Call this after a small delay, or it won't work
    [self performSelector:@selector(showNavbar) withObject:nil afterDelay:0.2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

@end
