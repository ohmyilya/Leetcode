List<int> twoSum(List<int> nums, int target) {
  Map<int, int> numToIndex = {};

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (numToIndex.containsKey(complement)) {
      return [numToIndex[complement]!, i];
    }
    numToIndex[nums[i]] = i;
  }

  return []; // Return an empty list if no solution is found.
}
