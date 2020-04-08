//
//  PMPerson.m
//  ArrayList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "PMPerson.h"

@implementation PMPerson

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> name:%@,  age:%ld,   sex:%ld", [self class], self, self.name,self.age,self.sex];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> name:%@,  age:%ld,   sex:%ld", [self class], self, self.name,self.age,self.sex];
}

@end
