class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cString = s.cString(using: .utf8)!
        let len = strlen(cString)
        var maxLength = 0
        var result = ""
        var resultI = 0
        var resultJ = 0
        for i in 0..<len {
            let start = i + maxLength
            if start >= len {
                break
            }
            for j in start..<len {
                let count = j - i + 1
                let center = count/2
                var match = true
                for k in 0..<center {
                    if cString[i+k] != cString[i+count-1-k] {
                        match = false
                        break
                    }
                }
                if match {
                    let length = j - i + 1
                    if length > maxLength {
                        resultI = i
                        resultJ = j
                        maxLength = length
                    }
                }
            }
        }
        let sub = cString[resultI...resultJ].map{$0} + [0]
        result = String(cString: sub)
        return result
    }
}
