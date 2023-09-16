function twoSum(nums, target)
    local numToIndex = {}
    
    for index, num in ipairs(nums) do
        local complement = target - num
        if numToIndex[complement] then
            return {numToIndex[complement], index}
        end
        numToIndex[num] = index
    end
    
    return {} -- Return an empty table if no solution is found.
end
