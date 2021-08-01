class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var insertItem: [Int] = []
        var isNewIntervalInserted = false 
        var i = 0
        while i < intervals.count || !isNewIntervalInserted {
            var skipI = false
            var item: [Int]!
            if i >= intervals.count {
                item = newInterval
                isNewIntervalInserted = true
                skipI = true
            } else {
                item = intervals[i]
            }
            if !isNewIntervalInserted {
                if newInterval[0] <= item[0] {
                    insertItem = newInterval
                    isNewIntervalInserted = true
                    skipI = true
                } else {
                    insertItem = item
                }
            } else {
                insertItem = item
            }
            if ans.isEmpty {
                ans.append(insertItem)
            } else {
                var last = ans.last!
                if insertItem[0] <= last[1] {
                    last[1] = max(insertItem[1], last[1])
                    ans[ans.count-1] = last
                } else {
                    ans.append(insertItem)
                }
            }
            if !skipI {
                i += 1
            }
        }
        return ans
    }
}
