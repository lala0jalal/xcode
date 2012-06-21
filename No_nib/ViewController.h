//
//  ViewController.h
//  No_nib
//
//  Created by lala jalal on 12-06-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{

    NSArray *cities;
}
@property (nonatomic, retain) UILabel *lable;
@property (retain , nonatomic) UITableView  *table ;
@property (nonatomic,retain) UISwitch  *on_of;
@property (nonatomic,retain) UITextView *text;
@property (nonatomic,retain) NSArray *cities;
@property(nonatomic,retain) UISlider *slide;
@end
