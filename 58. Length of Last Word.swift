class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let cs = s.cString(using: .ascii)!
        var i = strlen(cs) - 1
        var c = 0
        var t = false
        let space = " ".cString(using: .ascii)![0]

        while i >= 0 {
            if cs[i] == space {
                guard !t else { break }
            } else {
                t = true
                c += 1
            }
            i -= 1
        }
        return c
    }
}
