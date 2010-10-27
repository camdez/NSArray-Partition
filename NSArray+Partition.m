//
//  NSArray+Partition.m
//
//  Created by Cameron Desautels on 10/27/10.
//  Copyright 2010 Too Much Tea, LLC. All rights reserved.
//

#import "NSArray+Partition.h"


id identity(id obj, void* context) {
    return obj;
}

@implementation NSArray (Partition)

- (NSArray *)cpd_partitionedArray {
    return [self cpd_partitionedArrayUsingFunction:identity context:NULL];
}

- (NSArray *)cpd_partitionedArrayUsingFunction:(id (*)(id, void *))transformer context:(void *)context {
    NSMutableArray* partitions = [NSMutableArray array];
    NSMutableArray* partition = nil;
    
    id previousValue = nil;
    
    for (id rawValue in self) {
        id value = transformer(rawValue, context);
        if (value == nil)
            value = [NSNull null]; // XXX we can't put nil into an NSArray
        
        if (value == previousValue) {
            [partition addObject:rawValue];
        } else {
            if (partition != nil) {
                [partitions addObject:partition];
                [partition release];
            }
        
            partition = [[NSMutableArray alloc] initWithObjects:rawValue, nil];
        }
    
        previousValue = value;
    }

    if (partition != nil) {
        [partitions addObject:partition];
        [partition release];
    }

    return partitions;
}

@end
