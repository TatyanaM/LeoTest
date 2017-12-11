//
//  NetworkAPI.m
//  Ya_croco
//
//  Created by Tatiana Mudryak on 04/12/2017.
//  Copyright © 2017 Tatiana Mudryak. All rights reserved.
//

#import "NetworkAPI.h"
#import <AFNetworking/AFNetworking.h>
#import <AFHTTPSessionManager+Synchronous.h>

@interface NetworkAPI ()

@property (nonatomic, strong) NSURLRequest *request;

@end

@implementation NetworkAPI

-(instancetype)initWithRequest:(NSURLRequest *)request
{
	self = [super init];
	if (self)
	{
		_request = request;
	}

	return self;
}

+(id)startSyncLoadingWithURL:(NSString *)urlString params:(NSDictionary *)params
{
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	NSError *error = nil;
	id result = [manager syncGET:urlString
						   parameters:params
								 task:NULL
								error:&error];
	return result;
}

@end
