class Solution {
    func intToRoman(_ num: Int) -> String {
        var n = num
        let i0 = "IV".cString(using: .utf8)!
        let i1 = "XL".cString(using: .utf8)!
        let i2 = "CD".cString(using: .utf8)!
        let i3 = "M".cString(using: .utf8)!
        let s: [[CChar]] = [i0, i1, i2, i3]
        var i = 0
        var r: [CChar] = []

        while n > 0 {
            let m = n % 10
            if m == 4 {
                let c1 = s[i][1]
                let c2 = s[i][0]
                r.append(c1)
                r.append(c2)
            } else if m == 9 {
                let c1 = s[i+1][0]
                let c2 = s[i][0]
                r.append(c1)
                r.append(c2)
            } else if m > 0 {
                let mod = m % 5
                for _ in 0..<mod {
                    let c = s[i][0]
                    r.append(c)
                }
                if m >= 5 {
                    let c = s[i][1]
                    r.append(c)
                }
            }
            n /= 10
            i += 1
        }

        r.reverse()
        r += [0]

        return String(cString: r)
    }
}
