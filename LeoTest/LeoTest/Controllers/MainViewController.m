//
//  MainViewController.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 08/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "MainViewController.h"
#import "NewWordViewController.h"
#import "WordsTableViewDataSource.h"
#import "WordsStoreManager.h"

static NSString *const MainViewControllerTitle = @"Словарь";

@interface MainViewController () <UISearchBarDelegate>

//data
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) WordsTableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) WordsStoreManager *storeManager;

//search
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
	self.navigationItem.title = MainViewControllerTitle;
	UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"plusGreen"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(addNewWord)];
	self.navigationItem.rightBarButtonItem = addItem;

    self.storeManager = [WordsStoreManager new];
    
    self.tableViewDataSource = [WordsTableViewDataSource new];
    self.tableView.dataSource = self.tableViewDataSource;
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
	// load words data
	[self fetchVocabulary];

	// update view constraints
	[self.view setNeedsUpdateConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)fetchVocabulary
{
	[self.storeManager fetchVocabularyWithCompletionHandler:^(NSArray *vocabulary) {
		self.tableViewDataSource.words = vocabulary;
		[self.tableView reloadData];
	}];
}

- (void)addNewWord
{
    NewWordViewController *newWordController = [[NewWordViewController alloc] initWithNibName:NSStringFromClass([NewWordViewController class]) bundle:nil];
	[self.navigationController pushViewController:newWordController animated:YES];
}


#pragma mark - Search delegate methods

- (void)filterContentForSearchText:(NSString*)searchText
{
	[self.storeManager foundWord:searchText withCompletionHandler:^(NSArray *vocabulary) {
		self.tableViewDataSource.filteredWords = vocabulary;
		[self.tableView reloadData];
	}];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	if (searchBar.text.length == 0) {
		self.tableViewDataSource.searchEnabled = NO;
		[self.tableView reloadData];
	}
	else {
		self.tableViewDataSource.searchEnabled = YES;
		[self filterContentForSearchText:searchBar.text];
	}
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	self.tableViewDataSource.searchEnabled = YES;
	[self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	[searchBar setText:@""];
	self.tableViewDataSource.searchEnabled = NO;
	[_tableView reloadData];

}

@end
