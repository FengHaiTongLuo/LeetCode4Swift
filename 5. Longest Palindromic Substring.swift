// 暴力动态规划
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cs = s.cString(using: .ascii)!
        let n = strlen(cs)
        // 二维数组`c`用来缓存长度大于等于2的回文子串判定
        // 默认值为false
        var c: [[Bool]] = Array(repeating: Array(repeating: false, count: n),
                                count: n)
        // 确保n > 1，否则n <= 1的话直接返回字符串即可
        // 因为它肯定是回文子串
        guard n > 1 else { return s }

        // 保存一个最长回文子串的长度和子串范围索引
        var maxlen = 0
        var rng: (Int, Int) = (0, 0)

        // 寻找从2到n长度的回文子串
        for l in 2...n {
            // 开始遍历索引
            for i in 0..<n-l+1 {
                // 只有首尾相等时才有可能是回文子串
                if cs[i] == cs[i+l-1] && (l <= 3 || c[i+1][i+l-2]) {
                    // 保存计算结果
                    c[i][i+l-1] = true
                    if l > maxlen {
                        rng = (i, i+l-1)
                        maxlen = l
                    }
                }
            }
        }
        return String(cString: cs[rng.0...rng.1].map{$0} + [0])
    }
}

// 中心臂展
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cs = s.cString(using: .ascii)!
        let n = strlen(cs)
        func searchSpan(_ k: Int, _ x: Bool) -> Int {
            var i = 1
            let t = x ? 0 : 1
            while k - i + t >= 0 && k + i < n && cs[k-i+t] == cs[k+i] {
                i += 1
            }
            return x ? i * 2 - 1 : (i - 1) * 2
        }
        var maxLen = 0
        var rng = (0, 0)
        for k in 0..<n {
            let l1 = searchSpan(k, true)
            let l2 = searchSpan(k, false)
            let l = max(l1, l2)
            if l > maxLen {
                rng = l1 > l2 ? (k-l1/2, k+l1/2) : (k-l2/2+1, k+l2/2)
                maxLen = l
            }
        }
        return String(cString: cs[rng.0...rng.1].map{$0}+[0])
    }
}

// 马拉车

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cr = s.cString(using: .ascii)!
        var n = strlen(cr)
        // 由于已知字符串是ascii字符，那么可以用ascii值0作为占位符，不需要用到算法讲解中的`#`
        var cs: [CChar] = Array(repeating: 0, count: n*2)
        var i = 0
        while cr[i] != 0 {
            cs[i*2] = cr[i]
            i += 1
        }
        n = n * 2 - 1
        var c: [Int] = Array(repeating: 0, count: n)
        // 搜索单臂长，例如臂长为3，则单臂长为1，如果臂长为1，则单臂长为0
        // 参数o给定可以跳过的位移
        func searchPalindrome(_ p: Int, _ o: Int) -> Int {
            var i = o
            while p - i >= 0 && p + i < n && cs[p - i] == cs[p + i] {
                i += 1
            }
            return i - 1
        }
        var j = 0
        var l = 0 // 计算到目前为止被计算的臂展覆盖的最高索引位
        var maxlen = 0
        var rng: (Int, Int) = (0, 0)
        for i in 0..<n {
            var o = 1
            if i < l {
                o = min(c[j-(i-j)], l-i) // 计算可以跳过的臂展计算位移
            }
            let k = searchPalindrome(i, o)

            // 计算臂展长度（计算的是去掉占位符后的实际长度）
            var len = k / 2 * 2 + 1
            if cs[i] == 0 {
                len = (k+1) / 2 * 2
            }

            if len > maxlen {
                maxlen = len
                rng = (i-k, i+k)
            }
            if i + k > l {
                l = i + k
                j = i
            }
            c[i] = k
        }
        var ans: [CChar] = []
        for i in rng.0...rng.1 {
            if cs[i] != 0 {
                ans.append(cs[i])
            }
        }
        ans.append(0)
        return String(cString: ans)
    }
}
