class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var iHead = 0
        var iTail = 0
        let cString = s.cString(using: .utf8)!
        let count = cString.count - 1
        var array = Array(repeating: -1, count: 10000)
        var longest = 0
        while iTail < count {
            let key = Int(cString[iTail])
            let si = array[key]
            if si != -1 && si >= iHead {
                iHead = si + 1
            }
            array[key] = iTail
            if iTail - iHead + 1 > longest {
                longest = iTail - iHead + 1
            }
            iTail += 1
        }
        return longest
    }
}
