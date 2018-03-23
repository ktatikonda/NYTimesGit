//
//  FeaturedArticlesTableViewController.m
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import "FeaturedArticlesTableViewController.h"
#import "ArticleViewModel.h"
#import "NSArray+FunctionalHelpers.h"
#import "NYTimes-Swift.h"


@interface FeaturedArticlesTableViewController () <UISearchControllerDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) BaseTableViewController *resultsController;
@property (nonatomic, strong) UIRefreshControl *pullToRefreshControl;

@end

@implementation FeaturedArticlesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setup];
    [self fetchFeaturedArticles];
    [self setupSearchController];
}

- (void)setup {
    UIView  *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.navigationController.navigationBar.frame.size.height)];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:titleView.frame];
    titleLable.text = NSLocalizedString(@"NY.Times.Tile", nil);
    titleLable.textColor = [UIColor whiteColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:titleLable];
    self.navigationItem.titleView = titleView;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:63.0/255.0 green:225.0/255.0 blue:181.0/255.0 alpha:1.0];

    self.navigationItem.titleView = titleView;

    self.pullToRefreshControl = [UIRefreshControl new];
    self.pullToRefreshControl.backgroundColor = [UIColor clearColor];
    [self.pullToRefreshControl beginRefreshing];
    [self.pullToRefreshControl addTarget:self action:@selector(fetchFeaturedArticles) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.pullToRefreshControl];
}

- (void)fetchFeaturedArticles {
    __weak typeof(self) weakSelf = self;
    [[NYTimesAPI sharedInstance] fetchFeaturedArticlesWithCompletion:^(NSArray<FeaturedArticle *> * _Nonnull articles) {
        NSMutableArray *viewModels = [articles mapWithBlock:^(FeaturedArticle *article) {
            return [[ArticleViewModel alloc] initWithFeaturedArticle:article];
        }];
        weakSelf.viewModels = viewModels;

        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView beginUpdates];
            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
            [weakSelf.tableView endUpdates];
            [weakSelf.pullToRefreshControl endRefreshing];
        });
    }];
}

- (void)setupSearchController {
    self.resultsController = [BaseTableViewController new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsController];
    self.resultsController.tableView.delegate = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    [UIView cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(performDelayedSearch:)
               withObject:searchText
               afterDelay:0.5];
}

- (void)performDelayedSearch:(NSString *)searchQuery {
    __weak typeof(self) weakSelf = self;
    [[NYTimesAPI sharedInstance] searchArticlesWithQuery:searchQuery completion:^(NSArray<SearchArticle *> * _Nonnull articles) {
        NSMutableArray *viewModels = [articles mapWithBlock:^(SearchArticle *article) {
            return [[ArticleViewModel alloc] initWithSearchArticle:article];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.resultsController.viewModels = viewModels;
            [weakSelf.resultsController.tableView beginUpdates];
            [weakSelf.resultsController.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                                                withRowAnimation:UITableViewRowAnimationFade];
            [weakSelf.resultsController.tableView endUpdates];
        });
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleViewModel *viewModel = tableView == self.tableView ? self.viewModels[indexPath.row] : self.resultsController.viewModels[indexPath.row];
    ArticleDetailViewController *detailController = [ArticleDetailViewController buildWithViewModel:viewModel];
    [self.navigationController pushViewController:detailController animated:YES];
}

@end
