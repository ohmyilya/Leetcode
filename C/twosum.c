#include <stdio.h>

int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    int numToIndex[100000]; // Assuming the input constraints
    for (int i = 0; i < 100000; i++) {
        numToIndex[i] = -1;
    }
    
    int* result = (int*)malloc(2 * sizeof(int));
    
    for (int i = 0; i < numsSize; i++) {
        int complement = target - nums[i];
        if (numToIndex[complement] != -1) {
            result[0] = numToIndex[complement];
            result[1] = i;
            *returnSize = 2;
            return result;
        }
        numToIndex[nums[i]] = i;
    }
    
    *returnSize = 0;
    return result;
}