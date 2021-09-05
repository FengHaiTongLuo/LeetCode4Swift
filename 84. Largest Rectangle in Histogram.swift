class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let count = heights.count
        var leftLengths: [Int] = Array(repeating: 1, count: count)
        var rightLength: [Int] = Array(repeating: 1, count: count)
        for i in 0..<count {
            var j = i - 1
            while j >= 0 && heights[j] >= heights[i] {
                j -= leftLengths[j]
            }
            leftLengths[i] = i - j
        }
        var i = count - 1
        while i >= 0 {
            var j = i + 1
            while j < count && heights[j] >= heights[i] {
                j += rightLength[j]
            }
            rightLength[i] = j - i
            i -= 1
        }
        var max = -1
        for i in 0..<count {
            let length = leftLengths[i] + rightLength[i] - 1
            let area = length * heights[i]
            if area > max {
                max = area
            }
        }
        return max
    }
}
