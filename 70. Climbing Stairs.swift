class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var a = 1
        var b = 1
        var r = 0
        var i = 2
        while i <= n {
            i += 1
            r = a + b
            a = b
            b = r
        }
        return r
    }
}
