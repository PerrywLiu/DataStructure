//
//  PMArrayList.m
//  ArrayList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "PMArrayList.h"

#define DEFAULT_CAPACITY  10
#define ELEMENT_NOT_FOUND -1

@interface PMArrayList()
{
    NSInteger _size; ///元素数量
    NSMutableArray *_elements;
}
@end

@implementation PMArrayList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _elements = [[NSMutableArray alloc]initWithCapacity:DEFAULT_CAPACITY];
    }
    return self;
}

- (void)pmAddElement:(id)element
{
    if (element == nil) {
        return;
    }
        
    [self pmInsertElement:element atIndex:_size];
}

- (void)pmInsertElement:(id)element atIndex:(NSInteger)index
{
    if (element == nil) {
        return;
    }
    
    if (index < 0 || index > _elements.count) {
        return;
    }
        
    ///index以后的元素向后移动，腾出一个空间，用来插入element
    for (NSInteger i = _elements.count - 1; i >= index; i--) {
        _elements[i+1] = _elements[i];
    }
    
    _elements[index] = element;
    _size++;
}

- (id)pmRemoveObjectAtIndex:(NSInteger)index
{
    if (![self rangeCheck:index]) {
        return nil;
    }
    
    id oldElement = _elements[index];
    for (NSInteger i = index+1 ; i < _elements.count; i++) {
        _elements[i-1] = _elements[i];
    }
    
    _elements[_size--] = @"";
    
    return oldElement;
}

- (NSUInteger)pmIndexOfObject:(id)object
{
    if (object == nil) {
        return ELEMENT_NOT_FOUND;
    }
    
    for (int i = 0; i < _size; i++) {
        if ([object isEqual:_elements[i]]) {
            return i;
        }
    }
    
    return ELEMENT_NOT_FOUND;
}

- (id)pmGetElementAtIndex:(NSInteger)index
{
    if (![self rangeCheck:index]) {
        return nil;
    }
    
    return _elements[index];
}

- (BOOL)isEmpty
{
    return _size == 0;
}

- (void)pmClear
{
    for (int i = 0; i < _size; i++) {
        [self pmRemoveObjectAtIndex:i];
    }
    
    _size = 0;
}

- (NSUInteger)pmCount
{
    return _size;
}

- (BOOL)pmContainsElement:(id)element
{
    return [self pmIndexOfObject:element] != ELEMENT_NOT_FOUND;
}

#pragma mark  private Method
- (void)ensureCapacity:(NSUInteger)capacity
{
    NSUInteger oldCapacity = MAX(DEFAULT_CAPACITY, capacity);
    if (oldCapacity > capacity) {
        return;
    }
    
    ///新容量为旧容量的1.5倍
    NSUInteger newCapactiy = oldCapacity + (oldCapacity >> 1);
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:newCapactiy];
    for (NSInteger i = 0; i < oldCapacity; i++) {
        [array addObject:_elements[i]];
    }
    
    _elements = array;
    NSLog(@"%ld 扩容为：%ld",oldCapacity,newCapactiy);
}


- (BOOL)rangeCheckAdd:(NSUInteger)index
{
    if (index < 0 || index > _elements.count) {
        [self outOfBounds:index];
        return NO;
    }
    return YES;
}

- (BOOL)rangeCheck:(NSUInteger)index
{
    if (index < 0 || index >= _elements.count) {
        [self outOfBounds:index];
        return NO;
    }
    return YES;
}

- (void)outOfBounds:(NSUInteger)index
{
    NSLog(@"索引%ld越界",index);
}

- (void)print
{
    if (_size == 0) {
        NSLog(@"数组为空");
        return;
    }
    
    for (int i = 0; i < _size; i++) {
        NSLog(@"%@",[_elements[i] description]);
    }
}

@end
