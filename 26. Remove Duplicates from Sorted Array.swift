class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 1
        while i < nums.count {
            if nums[i] == nums[i-1] {
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
        return nums.count
    }
}
