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

// As above, but uses transformer to transform the value of each element
- (NSArray *)cpd_partitionedArrayUsingFunction:(id (*)(id))transformer;
@end
