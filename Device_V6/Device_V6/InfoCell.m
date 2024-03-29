
#import "InfoCell.h"
#import "DEVICE.h"

@interface InfoCell()

@property (nonatomic, retain) NSMutableArray   *dataArray1;
@property (nonatomic,retain) NSMutableArray *deviceArray;

@end

@implementation InfoCell
@synthesize dataArray1 = _dataArray1;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        hortable = [[UITableView alloc]initWithFrame:CGRectMake(100, -90, 140, 320) style:UITableViewStylePlain];
        hortable.delegate = self;
        hortable.dataSource = self;
        hortable.transform = CGAffineTransformMakeRotation(M_PI/2*3);
		[self addSubview:hortable];
        
                
    
        
//        _dataArray1 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",nil];
        
   }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return  [_deviceArray count];
 }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%d",indexPath.row];
    NSLog(@"porsection---->%d",porsection);
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil){
				cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
				cell.transform = CGAffineTransformMakeRotation(M_PI/2);
                [[cell textLabel] setText:[_dataArray1 objectAtIndex:indexPath.row]];
				cell.textLabel.numberOfLines = 0;
                cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
		
	}
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",[indexPath row]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


@end
