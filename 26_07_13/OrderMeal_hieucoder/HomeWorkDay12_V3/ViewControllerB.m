//
//  ViewControllerB.m
//  HomeWorkDay12_V3
//
//  Created by ios15 on 7/24/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewControllerB.h"
#import "ViewControllerC.h"


@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource =self;
    CGRect frame = [[self view] bounds];
    
    [[self.pageController view] setFrame:frame];
    ViewControllerC *initialViewControler = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewControler];
                                    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (ViewControllerC *)viewControllerAtIndex : (NSUInteger )index
{
    ViewControllerC *childViewController = [[ViewControllerC alloc]init];
    childViewController.index = index;
    return  childViewController;
    
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ViewControllerC *) viewController index];
    if (index == 0) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(ViewControllerC *)viewController index];
    
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}
- (IBAction)payment:(id)sender {
    UITableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"paymentTable"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (IBAction)payMent:(UIBarButtonItem *)sender {
    UITableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"paymentTable"];
    [self presentViewController:vc animated:YES completion:nil];

}

@end
