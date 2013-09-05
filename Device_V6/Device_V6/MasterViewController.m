//
//  MasterViewController.m
//  Device_V6
//
//  Created by ios15 on 8/7/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "DEVICE.h"
#import "InfoCell.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_searchBarDevice setShowsScopeBar:NO];
    [_searchBarDevice sizeToFit];
    
    
    
    CGRect newBounds = [[self tableView] bounds];
    newBounds.origin.y = newBounds.origin.y + _searchBarDevice.bounds.size.height;
    [[self tableView] setBounds:newBounds];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target: self action:@selector(searchButton:)];
    
    self.navigationItem.rightBarButtonItems = @[addButton,searchButton];
    CGRect frame = CGRectMake(-100,0,100,44);
    [self.searchBarDevice setFrame:frame];
    
    
     _deviceArray = [NSMutableArray arrayWithObjects:
                    [DEVICE operationSystemsDevice:@"iOS" name:@"Iphone3GS" price:@"350USD" imageView:[UIImage imageNamed:@"iphone3GS.jpg"]],
                    [DEVICE operationSystemsDevice:@"iOS" name:@"Iphone4" price:@"400USD" imageView:[UIImage imageNamed:@"iphone4.jpeg"]],
                     [DEVICE operationSystemsDevice:@"iOS" name:@"Iphone4S" price:@"450USD" imageView:[UIImage imageNamed:@"iphone4S.jpg"]],
                     [DEVICE operationSystemsDevice:@"iOS" name:@"Iphone5" price:@"500USD" imageView:[UIImage imageNamed:@"iphone5.jpeg"]],
                      [DEVICE operationSystemsDevice:@"Android" name:@"Samsung Galaxy S2" price:@"350USD" imageView:[UIImage imageNamed:@"SamsungS2.jpeg"]],
                       [DEVICE operationSystemsDevice:@"Android" name:@"Samsung Galaxy S4" price:@"450USD" imageView:[UIImage imageNamed:@"SamsungS4.jpg"]],
                       [DEVICE operationSystemsDevice:@"Android" name:@"LG Otimus Pro" price:@"350USD" imageView:[UIImage imageNamed:@"LG.jpeg"]],
                       [DEVICE operationSystemsDevice:@"Android" name:@"Sony Eprie Z " price:@"350USD" imageView:[UIImage imageNamed:@"sony.jpeg"]],
                       [DEVICE operationSystemsDevice:@"WP8" name:@"Nokia Lumina 520" price:@"250USD" imageView:[UIImage imageNamed:@"nokia520.jpg"]],
                        [DEVICE operationSystemsDevice:@"WP8" name:@"Nokia Lumina 920" price:@"500USD" imageView:[UIImage imageNamed:@"nokia920.jpeg"]],
                    [DEVICE operationSystemsDevice:@"WP8" name:@"Nokia Lumia 1020" price:@"550USD" imageView:[UIImage imageNamed:@"nokia1020.jpeg"]],
                    [DEVICE operationSystemsDevice:@"WP8" name:@"HTC 8S" price:@"500USD" imageView:[UIImage imageNamed:@"nokia1020.jpeg"]],
                    
                    nil];
    
    // 
    _fiteredDeviceArray                = [NSMutableArray arrayWithCapacity:[_deviceArray count]];
    
    // Reload the table
    [[self tableView] reloadData];
    
    [self customIconSearchBar];
}

- (void) customIconSearchBar
{
    UISearchBar *search = (UISearchBar *)[self.searchDisplayController.searchBar viewWithTag:3];
    [search setImage:[UIImage imageNamed:@"search2.png"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
 ;
        
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_deviceArray) {
        _deviceArray                  = [[NSMutableArray alloc] init];
    }
    NSString *newObject               = [DEVICE operationSystemsDevice:@"iOS" name:@"Iphone5S" price:@"650USD" imageView:[UIImage imageNamed:@"iphone5S.jpeg"]];
    [_deviceArray insertObject:newObject atIndex:0];
    NSIndexPath *indexPath            = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [_fiteredDeviceArray count];
    }
	else
	{
        return [_deviceArray count];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier    = @"Cell";
    UITableViewCell *cell              = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
         cell                          = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Create a new  Object
    DEVICE *device = nil;
    
    // Check to see whether the normal table or search results table is being displayed and set the  object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        device                        = [_fiteredDeviceArray objectAtIndex:[indexPath row]];
    }
	else
	{
        device                        = [_deviceArray objectAtIndex:[indexPath row]];
    }
    
    // Configure the cell
    UIButton *button = (UIButton *) [cell viewWithTag:1];
    [button setTitle:[device name] forState:UIControlStateNormal];
    [[cell contentView]addSubview:button];
    
  
    NSString *string                  = NSLocalizedString(@"New Price", "App title");
    [[cell textLabel] setText:[device name]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"New Price %@",[device price]]];
    [[cell imageView]setImage:[device imageView]];
    [cell  setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
   
    
    return cell;
}
- (void)doit
{
    NSLog(@"TEET good");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_deviceArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"showDetail"] ) {
        UIViewController *deviceDetailViewController = [segue destinationViewController];
        
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView)
        {
            NSIndexPath *indexPath1        = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle2    = [[_fiteredDeviceArray objectAtIndex:[indexPath1 row]] name];// tra ve Device.name.
            NSString *newPrice2            = [[_fiteredDeviceArray objectAtIndex:[indexPath1 row]] price];
            
            [deviceDetailViewController setTitle:[NSString stringWithFormat:@"New Price of %@",destinationTitle2]];// set title View = device.name
            [[segue destinationViewController] setDetailItem:newPrice2];
            NSLog(@"Tess");
        }
        else
        {
            NSIndexPath *indexPath        = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle    = [[_deviceArray objectAtIndex:[indexPath row]] name];
            NSString *newPrice            = [[_deviceArray objectAtIndex:[indexPath row]] price];
            
            [deviceDetailViewController setTitle:[NSString stringWithFormat:@"New Price of %@",destinationTitle]];// set title View = device.name
            [[segue destinationViewController] setDetailItem:newPrice];
            NSLog(@"Tet 2");
        
        }
        
    }
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}
#pragma mark Content Filtering by Predicate

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	// Update the filtered array based on the search text and scope.
	
    // Remove all objects from the filtered search array
	[self.fiteredDeviceArray removeAllObjects];
    
	// Filter the array using NSPredicate
    NSPredicate *predicate               = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    NSArray *tempArray                   = [_deviceArray filteredArrayUsingPredicate:predicate];
    
    if(![scope isEqualToString:@"All"]) {
        // Further filter the array with the scope  // SELF.(ten bien can loc)
        NSPredicate *scopePredicate      = [NSPredicate predicateWithFormat:@"SELF.operationSystem   contains[c] %@",scope];
        tempArray                        = [tempArray filteredArrayUsingPredicate:scopePredicate];
    }
    
    _fiteredDeviceArray = [NSMutableArray arrayWithArray:tempArray];
}


#pragma mark - UISearchDisplayController Delegate Methods
// Kiem tra text in Search bar

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
   // NSLog(@"%d",[self.searchDisplayController.searchBar selectedScopeButtonIndex]);
    
   // NSLog(@"%@",searchString);
   // NSLog(@"%@",[self.searchDisplayController.searchBar scopeButtonTitles]);// Ham tra ve kieu Array, cac button
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

// Kiem tra dieu kien search
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // Tells the table data source to reload when scope bar selection changes
     [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark - Search Button

- (IBAction)goToSearch:(id)sender
{
    // If you're worried that your users might not catch on to the fact that a search bar is available if they scroll to reveal it, a search icon will help them
    // Note that if you didn't hide your search bar, you should probably not include this, as it would be redundant
    [_searchBarDevice becomeFirstResponder];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}
- (void)searchButton:(id)sender

{
    [_searchBarDevice becomeFirstResponder];
}
@end
