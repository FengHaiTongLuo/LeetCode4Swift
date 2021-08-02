class Solution {
    func reverse(_ x: Int) -> Int {
        var i = x > 0 ? x : -x
        var r = 0
        while i > 0 {
            r = (r * 10) + (i % 10)
            i /= 10
        }
        if r < Int32.min || r > Int32.max {
            return 0
        }
        return x > 0 ? r : -r
    }
}
