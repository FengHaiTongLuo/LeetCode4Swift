class Solution {
    func sortColors(_ nums: inout [Int]) {
        var cache: [Int] = [0, 0, 0]
        for num in nums {
            cache[num] += 1
        }
        var j = 0
        for i in 0..<3 {
            for _ in 0..<cache[i] {
                nums[j] = i
                j += 1
            }
        }
    }
}
