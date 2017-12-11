//
//  NewWordViewController.m
//  LeoTest
//
//  Created by Tatiana Mudryak on 08/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "NewWordViewController.h"
#import "WordsStoreManager.h"
#import "TranslationManager.h"
#import "TranslationsTableViewDataSource.h"
#import "LoadingView.h"
#import "Word.h"

static NSString *const NewWordViewControllerTitle = @"Add word";

@interface NewWordViewController () <TranslationManagerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSString *translatedWord;
@property (nonatomic, strong) NSArray *translations;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (nonatomic, strong) LoadingView *loadingView;

//translation
@property (weak, nonatomic) IBOutlet UIView *translationView;
@property (weak, nonatomic) IBOutlet UITableView *translationsTableView;

@property (nonatomic, strong) TranslationManager *translationManager;
@property (nonatomic, strong) TranslationsTableViewDataSource *translationsDataSource;
@property (nonatomic, strong) WordsStoreManager *storeManager;

@end

@implementation NewWordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
	self.navigationItem.title = NewWordViewControllerTitle;
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = addItem;
    
    self.translationsDataSource = [TranslationsTableViewDataSource new];
    self.translationsTableView.dataSource = self.translationsDataSource;
    
    self.storeManager = [[WordsStoreManager alloc] init];
    self.translationManager = [[TranslationManager alloc] init];
    self.translationManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    self.translationView.hidden = YES;
    [self.wordTextField becomeFirstResponder];
    
    self.loadingView = [[LoadingView alloc] initWithView:self.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

- (void)showLoadingView
{
    [self.loadingView start];
}

- (void)hideLoadingView
{
    [self.loadingView stop];
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)translateWord
{
   // [self.loadingView start];
	self.translatedWord = self.wordTextField.text;
	if (self.translatedWord.length > 0) {
    	[self.translationManager translateWord:self.translatedWord withTranslationSource:YandexTranslator]; //пока по умолчанию яндекс
	} else {
		[self presentViewController:[AlertViewHelper alertWithTitle:@"Ошибка" andMessage:@"Введите слово!"]
						   animated:YES
						 completion:nil];
	}
}

- (IBAction)addWordToVocabulary
{
	[self.storeManager saveWord:self.translatedWord  withTranslation:self.translations andCompletionHandler:^(Word *word) {
		if (word) {
			[self newWordAdded];
		} else {
			[self presentViewController:[AlertViewHelper alertWithTitle:@"Ошибка" andMessage:@"Не удалось сохранить слово!"]
							   animated:YES
							 completion:nil];
		}
	}];
}

- (void)newWordAdded
{
    self.wordTextField.text = nil;
    [self.wordTextField becomeFirstResponder];
    self.translationsDataSource.translations = nil;
    [self.translationsTableView reloadData];
    [self presentViewController:[AlertViewHelper alertWithTitle:@"" andMessage:@"Слово успешно добавлено!"]
                       animated:YES
                     completion:nil];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self translateWord];
    return YES;
}


#pragma mark - TranslationManagerDelegate

- (void)translationsLoaded:(NSArray *)translations
{
	self.translations = translations;
    [self.loadingView stop];
    [self.wordTextField resignFirstResponder];
    self.translationsDataSource.translations = translations;
    self.translationView.hidden = NO;
    [self.translationsTableView reloadData];
}

- (void)translationFinishedWithError:(NSString *)error
{
    [self.loadingView stop];
    [self presentViewController:[AlertViewHelper alertWithTitle:@"Ошибка" andMessage:error]
                       animated:YES
                     completion:nil];
}

@end
