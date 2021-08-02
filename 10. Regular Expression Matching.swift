class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s1 = s.cString(using: .utf8)!
        let p1 = p.cString(using: .utf8)!
        let ls = strlen(s1)
        let lp = strlen(p1)

        let dot = ".".cString(using: .utf8)![0]
        let star = "*".cString(using: .utf8)![0]
        
        func match(_ i: Int, _ j: Int) -> Bool {
            if i >= ls && j >= lp {
                return true
            } else if j >= lp {
                return false
            }

            if j+1 < lp && p1[j+1] == star {
                // 前面是星星的情况
                if i < ls {
                    if p1[j] == dot || s1[i] == p1[j] {
                        return match(i+1, j) || match(i, j+2)
                    }
                }
                return match(i, j+2)
            } else {
                if i >= ls {
                    return false
                }
                // 前面不是星星的情况
                if p1[j] == dot || s1[i] == p1[j] {
                    // 匹配首字符
                    return match(i+1, j+1)
                } else {
                    // 不匹配
                    return false
                }
            }
            return false
        }

        return match(0, 0)
    }
}
