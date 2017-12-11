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
#import "WordsSearchManager.h"

static NSString *const MainViewControllerTitle = @"Словарь";

@interface MainViewController () <WordsStoreManageDelegate, WordsSearchManageDelegate>

//data
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) WordsTableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) WordsStoreManager *storeManager;

//search
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) WordsSearchManager *searchManager;

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
    [self.storeManager addDelegate:self];
    
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
	[self.storeManager fetchVocabulary];
}

- (void)addNewWord
{
    NewWordViewController *newWordController = [[NewWordViewController alloc] initWithNibName:NSStringFromClass([NewWordViewController class]) bundle:nil];
	[self.navigationController pushViewController:newWordController animated:YES];
}

#pragma mark - WordsStoreManageDelegate

-(void)vocabularyLoaded:(NSArray *)words
{
	self.tableViewDataSource.words = words;
	[self.tableView reloadData];
}

#pragma mark - WordsSearchManageDelegate

-(void)wordsFound:(NSArray *)words
{
    self.tableViewDataSource.words = words;
    [self.tableView reloadData];
}

@end
