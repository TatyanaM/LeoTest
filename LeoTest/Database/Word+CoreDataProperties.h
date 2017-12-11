//
//  Word+CoreDataProperties.h
//  
//
//  Created by Tatiana Mudryak on 09.12.2017.
//
//

#import "Word+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Word (CoreDataProperties)

+ (NSFetchRequest<Word *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *translation;
@property (nullable, nonatomic, copy) NSString *word;

@end

NS_ASSUME_NONNULL_END
