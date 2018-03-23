//
//  ArticleTableViewCell.h
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleViewModel.h"

@interface ArticleTableViewCell : UITableViewCell
- (void)configureWithViewModel:(ArticleViewModel *)viewModel;

@end
