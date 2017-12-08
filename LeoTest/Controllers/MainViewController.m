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
#import "WordsSearchBar.h"
#import "WordsStoreManager.h"

static NSString *const MainViewControllerTitle = @"Словарь";

@interface MainViewController ()

//data
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WordsTableViewDataSource *tableViewDataSource;

//search
@property (nonatomic, strong) WordsSearchBar *searchBar;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = MainViewControllerTitle;
	UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"plus"] style:UIBarButtonItemStylePlain target:self action:@selector(addNewWord)];
	self.navigationItem.rightBarButtonItem = addItem;
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[self addSearchBar];
	[self setupInitialTableView];

	[self.tableView reloadData];

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
	[WordsStoreManager fetchWordsWithCompletionHandler:^(NSArray *words) {

			self.tableViewDataSource.words = words;
			[self.tableView reloadData];
	
	}];
}

- (void)addNewWord
{
	NewWordViewController *newWordController = [[NewWordViewController alloc] init];
	[self.navigationController pushViewController:newWordController animated:YES];
}

#pragma mark - UI

- (void)setupInitialTableView
{
	if (!self.tableView) {
		self.tableView = [UITableView new];
		self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
		[self.view addSubview:self.tableView];
		self.tableViewDataSource = [WordsTableViewDataSource new];
		self.tableView.dataSource = self.tableViewDataSource;
	}
}

//- (void)addLoadingView
//{
//	self.loadingView = [LoadingView loadingViewWithMessage:@"Загружаю данные..."];
//	self.loadingView.hidden = YES;
//	[self.view addSubview:self.loadingView];
//	[self.view bringSubviewToFront:self.loadingView];
//}
//
- (void)addSearchBar
{
	self.searchBar = [[WordsSearchBar alloc] init];//WithDelegate:self.searchManager];
	[self.view addSubview:self.searchBar];
}


#pragma mark - Constraints

- (void)updateViewConstraints
{
//	[self.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
//		make.width.equalTo(@(LoadingViewWidth));
//		make.height.equalTo(@(LoadingViewHeight));
//		make.center.equalTo(self.view);
//	}];
//
	[self.searchBar mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.and.left.equalTo(self.view);
		make.top.equalTo(self.view.mas_top).with.offset(self.topLayoutGuide.length);
		make.height.equalTo(@SearchBarHeight);
	}];

	[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.right.and.left.equalTo(self.view);
		make.top.equalTo(self.searchBar.mas_bottom);
		make.bottom.equalTo(self.view);
	}];

	[super updateViewConstraints];
}

@end
