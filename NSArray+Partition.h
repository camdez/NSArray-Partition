//
//  NSArray+Partition.h
//
//  Created by Cameron Desautels on 10/27/10.
//  Copyright 2010 Too Much Tea, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Partition)
// Partition an array (returns an NSArray of NSArrays); assumes the array is already sorted
- (NSArray *)cpd_partitionedArray;

// As above, but uses transformer to transform the value of each element.  Each time the comparison function is called, it’s passed context as its second argument.
- (NSArray *)cpd_partitionedArrayUsingFunction:(id (*)(id, void *))transformer context:(void *)context;
@end