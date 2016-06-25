//
//  ViewController.m
//  AutoLayout
//
//  Created by Nandpal Jethanand on 2/15/16.
//  Copyright © 2016 SoftwebSolutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [tblList setTableHeaderView:vwHeader];
    vwTop.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.tagListView.canSelectTags = YES;
    self.tagListView.tagCornerRadius = 5.0f;
    self.tagListView.tagBackgroundColor = [UIColor lightGrayColor];
    self.tagListView.tagTextColor = [UIColor whiteColor];
    self.tagListView.tagSelectedBackgroundColor = [UIColor purpleColor];
    [self.tagListView.tags addObjectsFromArray:@[@"ITALIAN",@"FRENCH",
                                                 @"FISH",@"SEAFOOD",
                                                 @"AMERICAN",@"MEXICAN",
                                                 @"INDIAN",
                                                 @"VEGAN",
                                                 @"ISRAELI",
                                                 @"CHEF",
                                                 @"ASIAN",
                                                 @"MEAT",
                                                 @"BISTRO",
                                                 @"MEDITERRANEAN",
                                                 @"HUMMUS",
                                                 @"CHINESE",
                                                 @"JAPANESE",]];
    
    [self.tagListView setCompletionBlockWithSelected:^(NSInteger index) {
        NSLog(@"______%ld______", (long)index);
        for (NSString* obj in self.tagListView.selectedTags)
        {
            [self.tagListView.tags removeObject:obj];
            [self.tagListView.tags insertObject:obj atIndex:0];
        }
        [self.tagListView.collectionView reloadData];
    }];
}

#pragma mark - IBAction

- (IBAction)delete:(id)sender
{
    [self.tagListView.tags removeObjectsInArray:self.tagListView.selectedTags];
    [self.tagListView.selectedTags removeAllObjects];
    [self.tagListView.collectionView reloadData];
}

/*
- (void)addArrayOfWords
{
    [super viewDidLoad];
    [scrTagList setAutomaticResize:YES];
    arrWords = [[NSMutableArray alloc] initWithObjects:@"ITALIAN",
              @"FRENCH",
              @"FISH",
              @"SEAFOOD",
              @"AMERICAN",
              @"MEXICAN",
              @"INDIAN",
                @"VEGAN",
                @"ISRAELI",
                @"CHEF",
                @"ASIAN",
                @"MEAT",
                @"BISTRO",
                @"MEDITERRANEAN",
                @"HUMMUS",
                @"CHINESE",
                @"JAPANESE",
                nil];
    [scrTagList setTags:arrWords];
    [scrTagList setTagDelegate:self];
}*/

- (void)selectedTag:(NSString *)tagName tagIndex:(NSInteger)tagIndex
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:[NSString stringWithFormat:@"You tapped tag %@ at index %ld", tagName,(long)tagIndex]
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)btn1Pressed:(id)sender
{
    self.tagListView.hidden = NO;
    vwTopHeightConstraint.constant = 210;
    [vwTop updateConstraints];
}

-(IBAction)btn2Pressed:(id)sender
{
    self.tagListView.hidden = YES;
    vwTopHeightConstraint.constant = 90;
    [vwTop updateConstraints];
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    [cell.btnLast setTag: (3000 + indexPath.row)];
    [cell.btnLast addTarget:self action:@selector(clickBtnSubscribe:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

- (void)clickBtnSubscribe:(id)sender
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tblList];
    NSIndexPath *indexPath = [tblList indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil)
    {
        NSLog(@"indexPath is - %ld",(long)indexPath.row);
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    if (selected) {
    } else {
    }
}
@end
