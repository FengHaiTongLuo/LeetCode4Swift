class Solution {
    func charAt(_ s: String, _ i: Int) -> CChar? {
        let cString = s.cString(using: .utf8)!
        if i >= cString.count {
            return nil
        }
        return cString[i]
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        guard strs.count != 1 else { return strs[0] }
        var i = 0
        while true {
            guard let c = charAt(strs[0], i) else { break }
            var match = true
            for j in 1..<strs.count {
                if charAt(strs[j], i) != c {
                    match = false
                    break
                }
            }
            if !match {
                break
            }
            i += 1
        }

        guard i > 0 else { return "" }

        let str = strs[0].cString(using: .utf8)!
        let slice = str[0..<i]
        let sub = slice.map{$0} + [0]
        return String(cString: sub)
    }
}
