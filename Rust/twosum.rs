use std::collections::HashMap;

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut num_to_index = HashMap::new();
        
        for (index, num) in nums.iter().enumerate() {
            let complement = target - num;
            if let Some(&complement_index) = num_to_index.get(&complement) {
                return vec![complement_index as i32, index as i32];
            }
            num_to_index.insert(num, index as i32);
        }
        
        Vec::new()
    }
}
