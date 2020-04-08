//
//  PMArrayList.h
//  ArrayList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PMArrayList : NSObject

/// 初始化
/// @param capacity 容器长度
//- (instancetype)initWithCapacity:(NSInteger)capacity;

/// 添加一个元素到数组尾部
/// @param element 待添加元素
- (void)pmAddElement:(id)element;

/// 插入某个元素到指定位置
/// @param element 待插入元素
/// @param index 待插入元素索引
- (void)pmInsertElement:(id)element atIndex:(NSInteger)index;

/// 删除某个位置的元素
/// @param index 待删除元素的索引
- (id)pmRemoveObjectAtIndex:(NSInteger)index;

/// 查看某一个元素的索引
/// @param object 代查看元素
- (NSUInteger)pmIndexOfObject:(id)object;

/// 获取某个位置的元素
/// @param index 位置
- (id)pmGetElementAtIndex:(NSInteger)index;

/// 清空list
- (void)pmClear;

/// list是否为空
- (BOOL)isEmpty;

/// 计算数组的元素个数
- (NSUInteger)pmCount;

/// 是否包含某个元素
/// @param element 待求证元素
- (BOOL)pmContainsElement:(id)element;

- (void)print;

@end

NS_ASSUME_NONNULL_END
