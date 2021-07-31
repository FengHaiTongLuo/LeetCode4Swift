class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.contains(0) else { return true }
        guard nums.count > 1 else { return true }
        var maxIndex = 0
        let count = nums.count
        var i = 0
        while i < count {
            let jmp = nums[i] + i
            maxIndex = max(jmp, maxIndex)
            if maxIndex >= nums.count - 1 {
                return true
            }
            if nums[i] == 0 && maxIndex <= i {
                return false
            }
            i += 1
        }
        
        return false
    }
}
