//
//  MasterViewController.m
//  National_V1
//
//  Created by ios15 on 8/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#define COUNTRY_KEY @"country"

@interface MasterViewController () {
     NSMutableArray *filteredName;
    UISearchDisplayController *searchController;
    NSArray *keys;
}
@end

@implementation MasterViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *editBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(doEdit:)];
	UIBarButtonItem *addCountry = [UIBarButtonItem alloc]initWithTitle:@"Add" style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>
    NSString *dataPath                     = [[NSBundle mainBundle] pathForResource:@"countryList"
                                                                             ofType:@"plist"];
    self.data                              = [NSArray arrayWithContentsOfFile:dataPath];

    [self customTableFooter];
    [self customTableHeader];
    
    UISearchBar *searchBar                 = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
   self.myTableView.tableHeaderView        = searchBar;
    searchController = [[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
  searchController.delegate = self;
    searchController.searchResultsDataSource= self;
    
    
    
}
- (void)doEdit: (UIBarButtonItem *)barBtn

{
    
    if (self.myTableView.editing == YES) {
        statements
    }
}
#pragma mark - Custom table view header footer
- (void) customTableHeader
{
    CGRect titleRect                       = CGRectMake(0, 0, 300, 40);
    UILabel *tableTitle                    = [[UILabel alloc] initWithFrame:titleRect];
    tableTitle.textColor                   = [UIColor blueColor];
    tableTitle.backgroundColor             = [self.myTableView backgroundColor];
    tableTitle.opaque                      = YES;
    tableTitle.font                        = [UIFont boldSystemFontOfSize:18];
    tableTitle.text                        = @"Header";
    self.myTableView.tableHeaderView       = tableTitle;
    [self.myTableView reloadData];
}
- (void) customTableFooter
{  
    CGRect titleRect                       = CGRectMake(0, 0, 300, 40);
    UILabel *tableTitle                    = [[UILabel alloc] initWithFrame:titleRect];
    tableTitle.textColor                   = [UIColor blueColor];
    tableTitle.backgroundColor             = [self.myTableView backgroundColor];
    tableTitle.opaque                      = YES;
    tableTitle.font                        = [UIFont boldSystemFontOfSize:18];
    tableTitle.text                        = @"Footer";
    self.myTableView.tableFooterView       = tableTitle;
    [self.myTableView reloadData];

}
#pragma mark - Table view Delegate
- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *continent                = [self.data objectAtIndex:section];
    NSString *continentName                = [continent objectForKey :@"continent"];
    return continentName;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)   tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result                        = 20.0f;
    if ([tableView isEqual:self.myTableView])
    {
        result                            = 60.0f;
    }
    return result;
}
#pragma mark - Table view dataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *continent               = [self.data objectAtIndex:section];
    NSArray *countries                    = [continent valueForKey:@"country"];
    return [countries count];
}
#pragma mark - Table View
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            UITableViewCell *result       = [[UITableViewCell alloc]
                      initWithStyle:UITableViewCellStyleSubtitle
                    reuseIdentifier:@"MyCell"];
            result = [tableView dequeueReusableCellWithIdentifier  : @"MyCell"];
            NSDictionary *continent       = [self.data objectAtIndex: indexPath.section];
            NSArray *countries            = [continent valueForKey  :@"country"];
            NSDictionary *country         = [countries objectAtIndex: indexPath.row];
            NSString *countryName         = [country valueForKey    : @"name"];
            NSNumber *population          = [country valueForKey    : @"population"];
            result.textLabel.text         = countryName;
            result.detailTextLabel.text   = [NSString stringWithFormat:@"Dan so %@",population];
            NSString *flag                = [country valueForKey      :@"flag"];
            result.imageView.image        = [UIImage imageNamed       :flag];
            return result;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)                 sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath            = [self.myTableView indexPathForSelectedRow];
        NSLog(@" %@",indexPath);
        NSDictionary *continent           = [self.data objectAtIndex: indexPath.section];
        NSArray *countries                = [continent valueForKey  :@"country"];
        NSDictionary *country             = [countries objectAtIndex: indexPath.row];
        NSString *address                 = [country valueForKey    : @"id"];
        NSLog(@" %@",address);
        [[segue destinationViewController] setDetailItem:address];
    }
}
#pragma mark - Table view delete
- (void) tab

@end
