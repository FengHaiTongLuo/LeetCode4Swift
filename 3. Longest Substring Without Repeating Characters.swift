class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 算法边界不包含空字符串，判定返回
        guard !s.isEmpty else { return 0 }

        let cs = s.cString(using: .ascii)!
        let len = strlen(cs)

        // 初始化i和j
        var i = 0
        var j = 1
        
        // cache存放遍历字符的位置
        var cache: [Int] = Array(repeating: -1, count: 128)
        var m = j - i
        // cache保存着第一个字符的位置
        cache[Int(cs[i])] = i
        while j < len {
            let k = cache[Int(cs[j])]
            if k >= i {
                // 当cache保存的字符位置在范围内，说明出现字符冲突
                // 调整 i 让它往前跳
                i = k + 1
            }
            cache[Int(cs[j])] = j
            j += 1
            // i被调整过后，或者没有冲突字符，新子串也是无重复子串
            m = max(m, j-i)
        }
        return m
    }
}
