class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let cs1 = word1.cString(using: .utf8)!
        let cs2 = word2.cString(using: .utf8)!
        let c1 = strlen(cs1)
        let c2 = strlen(cs2)
        var cache: [[Int]] = Array(repeating: Array(repeating: -1, count: c2) , count: c1)
        func calc(_ i: Int, _ j: Int) -> Int {
            if i == 0 && j == 0 {
                cache[i][j] = cs1[i] == cs2[j] ? 0 : 1
                return cache[i][j]
            }
            if i < 0 {
                return j + 1
            }
            if j < 0 {
                return i + 1
            }
            if cache[i][j] != -1 {
                return cache[i][j]
            }
            var v1 = calc(i-1, j-1)
            if cs1[i] != cs2[j] {
                v1 += 1
            }
            let v2 = calc(i-1, j) + 1
            let v3 = calc(i, j-1) + 1
            cache[i][j] = min(min(v1, v2), v3)
            return cache[i][j]
        }

        for i in 0..<c1 {
            for j in 0..<c2 {
                let v = calc(i, j)
            }
        }
        return calc(c1-1, c2-1)
    }
}
