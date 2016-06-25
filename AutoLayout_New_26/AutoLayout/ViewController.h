//
//  ViewController.h
//  AutoLayout
//
//  Created by Nandpal Jethanand on 2/15/16.
//  Copyright © 2016 SoftwebSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWTagList.h"
#import "JCTagListView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, DWTagListDelegate>
{
    IBOutlet UITableView *tblList;
    IBOutlet UIView *vwHeader;
    
    // vwTop objects
    IBOutlet NSLayoutConstraint *vwTopHeightConstraint;
    IBOutlet UIView *vwTop;
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    
    //Array of words
    NSMutableArray *arrWords;
    //IBOutlet DWTagList *scrTagList;
}
@property (nonatomic, weak) IBOutlet JCTagListView *tagListView;

-(IBAction)btn1Pressed:(id)sender;
-(IBAction)btn2Pressed:(id)sender;

@end

@interface CustomCell : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnLast;

@end

