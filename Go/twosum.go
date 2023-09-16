func twoSum(nums []int, target int) []int {
    numToIndex := make(map[int]int)
    
    for i, num := range nums {
        complement := target - num
        if idx, ok := numToIndex[complement]; ok {
            return []int{idx, i}
        }
        numToIndex[num] = i
    }
    
    return []int{}
}
