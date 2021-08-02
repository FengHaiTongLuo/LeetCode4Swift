class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x < 10 { return true }
        if x % 10 == 0 { return false }
        var r = 0
        var x = x
        while x > r {
            r = r * 10 + x % 10
            x /= 10
        }
        return x == r || x == r / 10
    }
}
