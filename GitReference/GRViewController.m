//
//  GRViewController.m
//  GitReference
//
//  Created by Ross McIlwaine on 2/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";
static CGFloat labelHeight = 45;

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat top = 20;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, top, self.view.frame.size.width, self.view.frame.size.height)];
    //scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 300);
    [self.view addSubview:scrollView];
    
    CGFloat labelWidth = self.view.frame.size.width - margin;
    
   // int top = topMagin;
    
    top += labelHeight / 2;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, labelHeight)];
    titleLabel.text = @"Git Reference";
    [titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    [scrollView addSubview:titleLabel];
    
    top += labelHeight * 1.5;
                             
    for (int i = 0; i < [self gitCommands].count; i++)
    {
        UILabel *labelCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, labelHeight)];
        labelCommand.text = [self gitCommands][i][Command];
        [scrollView addSubview:labelCommand];
        
        top += labelHeight / 2; // top = top + 20;
        
        UILabel *labelReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, labelHeight)];
        labelReference.text = [self gitCommands][i][Reference];
        labelReference.numberOfLines = 0;
        [scrollView addSubview:labelReference];
        
        top += labelHeight * 1.3;
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);

}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
