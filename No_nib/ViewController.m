//
//  ViewController.m
//  No_nib
//
//  Created by lala jalal on 12-06-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize table = _table;
@synthesize lable = _lable;
@synthesize on_of = _on_of;
@synthesize text = _text;
@synthesize cities = _cities;
@synthesize slide = _slider;

- (void)dealloc {
    [cities release];
    [super dealloc];
}

/*
 
 - use a UITextField, UISwitch, UISlider (between 0 and 1), 
 - when user presses a button (UIButton), start a timer so that you can update the progress bar (UIProgressView, and activity UIActivityIndicatorView)
 - after 2 seconds, it's over, stop the activity indicator, hide the progress bar, display a popup with the text, the ON/OFF value and the slider value.
 */

/*
- (void)startTimer {
 // Keep those in instance variables/properties, and call "invalidate" method on the updateProgressBarTimer
    NSTimer *updateProgressBarTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:REPLACE userInfo:nil repeats:YES];
    NSTimer *globalTimer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:REPLACE userInfo:nil repeats:NO];
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Me!"];
	// Do any additional setup after loading the view, typically from a nib.
    UITableView *aTable = [[[UITableView alloc] initWithFrame:CGRectMake(50,50,200,150) style:UITableViewStylePlain] autorelease];
    [aTable setDataSource:self];
    [aTable setDelegate:self];
    
    
    [self setTable:aTable];
    
//#warning USE THE PROPERTY
  //  [cities release];
    self.cities = [[[NSArray alloc]initWithObjects:@"montreal",@"toronto",@"quebec",nil]autorelease];
    
    
    
        
//#warning RENAME TO LABEL    
    [self setLable:[[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 30, 30)] autorelease]];
                 
    [self.lable setText:@"color fh fghfgh fgh gfhfgh fghfg fhf"];
    [self.lable sizeToFit];
    

    [self.lable setTextColor:[UIColor redColor]];
     
     
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(10, 300, 60, 30)];
    [button addTarget:self action:@selector(moveTable:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.on_of = [[[UISwitch alloc]initWithFrame:CGRectMake(20,250, 100,20)] autorelease];

    [self.on_of addTarget:self action:@selector(switchTon:) forControlEvents:UIControlEventValueChanged];

   
    self.text = [[[UITextView alloc]initWithFrame:CGRectMake(20,350, 200,20)]autorelease];
    [self.text setBackgroundColor:[UIColor greenColor]];
    
    
    self.slide = [[[UISlider alloc]initWithFrame:CGRectMake(20,400,200,20)]autorelease];
    
    [self.slide addTarget:self action:@selector(slideMove:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    [self.view addSubview:self.slide];
    
    [self.view addSubview:self.on_of];
    [self.view addSubview:button];
    [self.view addSubview:aTable];
    [self.view addSubview: self.lable];
}

- (NSInteger)tableView : (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return cities.count;
 
}

- (void)startTimer {
    // Keep those in instance variables/properties, and call "invalidate" method on the updateProgressBarTimer
//NSTimer *updateProgressBarTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateProgressBar) userInfo: nil repeats: YES]
//NSTimer *globalTimer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:REPLACE userInfo:nil repeats:NO];
}



 -(void)switchTon:(id)sender
    {     
             
        if ([self.on_of isOn])
        {
            self.text.hidden = NO;
            
           [self.view addSubview:self.text];
        
                      
        }
        else {
            self.text.hidden = YES;
            
        }
        
        
    }
-(void)slideMove:(id)sender
{



 self.text.text =[[NSString alloc] initWithFormat:@"The value is %.2f",self.slide.value ] ;

}

- (void)moveTable:(id)sender {
    [self.table setFrame:CGRectMake(30, 0, 200, 200)];
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
     static NSString *CellIdentifier = @"Cell";

     UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil )
    {
    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier ]autorelease];
 
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
#warning  USE THE GETTER
    cell.textLabel .text = [self.cities objectAtIndex:indexPath.row]; 
     return cell;

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
