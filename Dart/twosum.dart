#import <Foundation/Foundation.h>

NSArray* twoSum(NSArray* nums, NSInteger target) {
    NSMutableDictionary* numToIndex = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < [nums count]; i++) {
        NSNumber* num = [nums objectAtIndex:i];
        NSInteger complement = target - [num integerValue];
        
        NSNumber* complementIndex = [numToIndex objectForKey:[NSNumber numberWithInteger:complement]];
        if (complementIndex != nil) {
            return @[[complementIndex integerValue], i];
        }
        
        [numToIndex setObject:[NSNumber numberWithInteger:i] forKey:num];
    }
    
    return @[]; // Return an empty array if no solution is found.
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* nums = @[@(2), @(7), @(11), @(15)];
        NSInteger target = 9;
        NSArray* result = twoSum(nums, target);
        NSLog(@"%@", result);
    }
    return 0;
}
