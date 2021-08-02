class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var cache: [[Int]] = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                guard i != 0 || j != 0 else { continue }
                var step = 0
                if i > 0 {
                    step += cache[i-1][j]
                }
                if j > 0 {
                    step += cache[i][j-1]
                }
                cache[i][j] = step
            }
        }
        return cache[m-1][n-1]
    }
}
