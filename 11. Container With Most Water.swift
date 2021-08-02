class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var height = height
        func _maxArea() -> Int {
            let count = height.count
            var cache: [Int] = Array(repeating: -1, count: 40000)
            var maxHeight = 0
            var result = 0
            for i in 0..<count {
                let h = height[i]
                if h > maxHeight {
                    for j in maxHeight+1...h {
                        cache[j] = i
                    }
                    maxHeight = h
                }
                let i0 = cache[h]
                if i0 == -1 {
                    continue
                }
                let area = (i - i0) * h
                if area > result {
                    result = area
                }
            }
            return result
        }
        let m1 = _maxArea()
        height.reverse()
        let m2 = _maxArea()
        
        return m1 > m2 ? m1 : m2
    }
}
