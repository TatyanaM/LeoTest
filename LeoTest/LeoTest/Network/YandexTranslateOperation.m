//
//  YandexTranslateOperation.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "YandexTranslateOperation.h"
#import "WordsStoreManager.h"
#import "NetworkAPI.h"

static NSString * const translateURL = @"https://translate.yandex.net/api/v1.5/tr.json/translate";
static NSString * const langDetectionURL = @"https://translate.yandex.net/api/v1.5/tr.json/detect";
static NSString * const Yandex_APIKey = @"trnsl.1.1.20171207T110424Z.9ace9422795dde0d.d4e3bf83160344491f56776791b86f5125f15b2e";

@interface YandexTranslateOperation ()

@property (nonatomic, strong) NSString *textLanguage;
@property (nonatomic, strong) NSString *text;

@end

@implementation YandexTranslateOperation

-(id)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        _text = [text copy];
    }
    return self;
}


-(void)main
{
    [self detectTextLanguage];
}

- (void)detectTextLanguage
{
    NSString *error = nil;
    NSString *langDetectUrlString = [NSString stringWithFormat:@"%@?key=%@&text=%@", langDetectionURL, Yandex_APIKey, self.text];
	NSDictionary *responseData = [NetworkAPI startSyncLoadingWithURL:langDetectUrlString params:nil error:error];

	if ([self isSuccessfulResponse:responseData]) {
		self.textLanguage = responseData[@"lang"];
		[self translateWord];
	} else {
        error = responseData[@""];
        if ([self.delegate respondsToSelector:@selector(translationFailedWithError:)])
            [self.delegate translationFailedWithError:error];
    }
}

- (void)translateWord
{
    NSString *error = nil;
    NSString *translateLang = [_textLanguage isEqualToString:@"en"] ? @"en-ru" : @"ru-en"; 
    NSString *encodedText = [self.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"%@?key=%@&text=%@&lang=%@", translateURL, Yandex_APIKey, encodedText, translateLang];
    NSDictionary *responseData = [NetworkAPI startSyncLoadingWithURL:urlString params:nil error:error];

	if ([self isSuccessfulResponse:responseData]) {
		NSArray *translations = responseData[@"text"];
		if (translations)
		{
			if ([self.delegate respondsToSelector:@selector(translationFinishedWithResult:)])
				[self.delegate translationFinishedWithResult:translations];
		}
	} else {
		if ([self.delegate respondsToSelector:@selector(translationFailedWithError:)])
			[self.delegate translationFailedWithError:error];
	}
}

- (BOOL)isSuccessfulResponse:(NSDictionary *)responseData
{
	if ([responseData isKindOfClass:[NSDictionary class]] && [responseData[@"code"] isEqualToNumber:@200])
		return YES;
	else
		return NO;
}

@end
