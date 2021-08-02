class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var cache: [[Int]] = Array(repeating: Array(repeating: 0, count: grid[0].count)
                                     , count: grid.count)
        for i in 0..<cache.count {
            for j in 0..<cache[0].count {
                var sum = grid[i][j]
                var add = Int(Int32.max)
                if i > 0 && cache[i-1][j] < add {
                    add = min(cache[i-1][j], add)
                }
                if j > 0 && cache[i][j-1] < add {
                    add = min(cache[i][j-1], add)
                }
                if add == Int(Int32.max) {
                    add = 0
                }
                cache[i][j] = sum + add
            }
        }
        return cache[cache.count-1][cache[0].count-1]
    }
}
