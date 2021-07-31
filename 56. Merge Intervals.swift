class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sorted = intervals.sorted(by: { $0[0] < $1[0] })
        var ans: [[Int]] = []
        var last: [Int] = []
        for item in sorted {
            if last.isEmpty {
                last = item
            } else if item[0] <= last[1] {
                last[1] = max(item[1], last[1])
            } else {
                ans.append(last)
                last = item
            }
        }
        ans.append(last)
        return ans
    }
}
