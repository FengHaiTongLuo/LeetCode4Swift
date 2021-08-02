class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var cache: [[Int]] = Array(repeating: Array(repeating: 0,
                                                    count: obstacleGrid[0].count), 
                                   count: obstacleGrid.count)
        cache[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0
        for i in 0..<cache.count {
            for j in 0..<cache[0].count {
                var step = cache[i][j]
                if i > 0 && obstacleGrid[i-1][j] == 0 {
                    step += cache[i-1][j]
                }
                if j > 0 && obstacleGrid[i][j-1] == 0 {
                    step += cache[i][j-1]
                }
                cache[i][j] = obstacleGrid[i][j] == 0 ? step : 0
            }
        }
        return cache[cache.count-1][cache[0].count-1]
    }
}
