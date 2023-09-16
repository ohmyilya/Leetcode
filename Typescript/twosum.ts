function twoSum(nums: number[], target: number): number[] {
    const numToIndex: { [key: number]: number } = {};
    
    for (let i = 0; i < nums.length; i++) {
        const complement = target - nums[i];
        if (numToIndex[complement] !== undefined) {
            return [numToIndex[complement], i];
        }
        numToIndex[nums[i]] = i;
    }
    
    return []; // Return an empty array if no solution is found.
}
