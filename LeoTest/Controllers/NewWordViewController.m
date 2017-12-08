//
//  NewWordViewController.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 08/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "NewWordViewController.h"
#import "AddWordView.h"
#import "WordsStoreManager.h"

static NSString *const NewWordViewControllerTitle = @"Добавить слово";

@interface NewWordViewController () <AddWordViewDelegate>

@property (nonatomic, strong) AddWordView *addWordView;
@property (nonatomic, strong) WordsStoreManager *storeManager;

@end

@implementation NewWordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationItem.title = NewWordViewControllerTitle;

	self.storeManager = [[WordsStoreManager alloc] init];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self addNewWordView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addNewWordView
{
	if (!self.addWordView)
	{
		self.addWordView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AddWordView class]) owner:self options:nil] objectAtIndex:0];
		self.addWordView.delegate = self;
		[self.view addSubview:self.addWordView];
	}
}

#pragma mark - AddWordViewDelegate

-(void)addWord:(NSString *)word
{
	[WordsStoreManager addWord:word withCompletionHandler:^(BOOL result, NSError *error) {

	}];
}

#pragma mark - Constrains

- (void)updateViewConstraints
{
	[self.addWordView mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.top.and.bottom.equalTo(self.view);
		make.right.and.left.equalTo(self.view);
		make.center.equalTo(self.view);
	}];
	[super updateViewConstraints];
}
@end
