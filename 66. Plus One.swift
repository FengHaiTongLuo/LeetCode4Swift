class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var ans: [Int] = digits.reversed()
        var i = 0
        ans[0] += 1
        while i < ans.count - 1 {
            if ans[i] >= 10 {
                ans[i+1] += 1
                ans[i] -= 10
            }
            i += 1
        }
        if ans[ans.count-1] >= 10 {
            ans[ans.count-1] -= 10
            ans.append(1)
        }
        return ans.reversed()
    }
}
