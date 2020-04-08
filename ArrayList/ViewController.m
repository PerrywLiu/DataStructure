//
//  ViewController.m
//  ArrayList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "ViewController.h"
#import "PMArrayList.h"
#import "PMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testString];
    
//    [self testObject];
}

- (void)testString
{
    PMArrayList *arrayList = [[PMArrayList alloc]init];
    ///添加元素
    [arrayList pmAddElement:@"0"];
    [arrayList pmAddElement:@"1"];
    [arrayList pmAddElement:@"2"];
    [arrayList pmAddElement:@"3"];
    [arrayList pmAddElement:@"4"];
    [arrayList pmAddElement:@"5"];
    [arrayList pmAddElement:@"6"];
    [arrayList pmAddElement:@"7"];
    [arrayList pmAddElement:@"8"];
    [arrayList pmAddElement:@"9"];
    
    NSLog(@"count:%ld",[arrayList pmCount]);
    ///向特定位置插入元素
    [arrayList pmInsertElement:@"200" atIndex:3];
    NSLog(@"count:%ld",[arrayList pmCount]);
    
    [arrayList print];
    
    ///删除特定位置的元素
    id removeElement = [arrayList pmRemoveObjectAtIndex:1];
    NSLog(@"removeElement:%@",removeElement);
    
    NSLog(@"count:%ld",[arrayList pmCount]);
    
    [arrayList print];
    
    ///获取某个元素的索引
    NSUInteger index = [arrayList pmIndexOfObject:@"2"];
    NSLog(@"index = %ld",index);
    
    //取某个索引对应的元素
    id element = [arrayList pmGetElementAtIndex:2];
    NSLog(@"element:%@",element);
    
    ///是否包含某个元素
    NSLog(@"是否包含元素30：%d",[arrayList pmContainsElement:@"30"]);
    
    NSLog(@"[arrayList isEmpty]:%d",[arrayList isEmpty]);
    NSLog(@"清除操作");
    [arrayList pmClear];
    [arrayList print];
    NSLog(@"[arrayList isEmpty]:%d",[arrayList isEmpty]);
}


- (void)testObject
{
    PMPerson *person1 = [[PMPerson alloc]init];
    person1.name = @"jack";
    person1.age = 20;
    person1.sex = 1;
    
    PMPerson *person2 = [[PMPerson alloc]init];
    person2.name = @"john";
    person2.age = 18;
    person2.sex = 1;
    
    PMPerson *person3 = [[PMPerson alloc]init];
    person3.name = @"lucy";
    person3.age = 16;
    person3.sex = 2;
    
    PMPerson *person4 = [[PMPerson alloc]init];
    person4.name = @"david";
    person4.age = 22;
    person4.sex = 1;
    
    PMPerson *person5 = [[PMPerson alloc]init];
    person5.name = @"lily";
    person5.age = 18;
    person5.sex = 1;
    
    PMArrayList *arrayList = [[PMArrayList alloc]init];
    [arrayList pmAddElement:person1];
    [arrayList pmAddElement:person2];
    [arrayList pmAddElement:person3];
    [arrayList pmAddElement:person4];
    [arrayList pmAddElement:person5];
    
    NSLog(@"count:%ld",[arrayList pmCount]);
    [arrayList print];
    
    NSInteger index = [arrayList pmIndexOfObject:person3];
    NSLog(@"index = %ld",index);
    
    PMPerson *person = [arrayList pmRemoveObjectAtIndex:3];
    NSLog(@"被删除的元素：%@",person);
    
    NSLog(@"count:%ld",[arrayList pmCount]);
}

@end
