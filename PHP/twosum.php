class Solution {
    function twoSum($nums, $target) {
        $numToIndex = array();
        
        for ($i = 0; $i < count($nums); $i++) {
            $complement = $target - $nums[$i];
            if (array_key_exists($complement, $numToIndex)) {
                return array($numToIndex[$complement], $i);
            }
            $numToIndex[$nums[$i]] = $i;
        }
        
        return array(); // Return an empty array if no solution is found.
    }
}

$nums = array(2, 7, 11, 15);
$target = 9;
$solution = new Solution();
$result = $solution->twoSum($nums, $target);
print_r($result);
