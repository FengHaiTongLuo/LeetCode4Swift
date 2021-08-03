class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var cache: [[Int?]] = Array(repeating: Array(repeating: nil, count: 1001), count: 1001)
        let count = nums.count
        var sorted = nums.sorted()

        func search(_ begin: Int, _ end: Int, _ number: Int) -> Int? {
            guard end > begin else { return nil }
            var b = begin
            var e = end
            var minAbs = Int(Int32.max)
            var result = 0

            while e > b {
                let c = (e + b) / 2
                let a = abs(sorted[c]-number)
                if a < minAbs {
                    minAbs = a
                    result = c
                }
                if sorted[c] < number {
                    b = c + 1
                } else if sorted[c] > number {
                    e = c
                } else {
                    return c
                }
            }

            return result
        }

        var result = 0
        var minAbs = Int(Int32.max)
        for i in 0..<count {
            for j in i+1..<count {
                let sum = sorted[i] + sorted[j]
                guard let k = search(j+1, count, target - sum) else { continue }
                let r = sum + sorted[k]
                if abs(r-target) < minAbs {
                    minAbs = abs(r-target)
                    result = r
                }
            }
        }
        return result
    }
}
