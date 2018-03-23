//
//  BaseTableViewController.h
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDetailViewController.h"
#import "ArticleTableViewCell.h"
#import "NYTimes-Swift.h"

@interface BaseTableViewController : UITableViewController
@property (nonatomic, strong) NSArray<ArticleViewModel *> *viewModels;

@end
