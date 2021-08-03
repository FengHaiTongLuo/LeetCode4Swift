class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let cs1 = a.cString(using: .ascii)!
        let cs2 = b.cString(using: .ascii)!
        var i = a.count-1
        var j = b.count-1
        var str = ""
        let zero = "0".cString(using: .ascii)![0]
        var addone = false
        while i >= 0 || j >= 0 {
            var value = 0
            if i >= 0 {
                value += Int(cs1[i] - zero)
            }
            if j >= 0 {
                value += Int(cs2[j] - zero)
            }
            value += addone ? 1 : 0
            if value >= 2 {
                str += "\(value-2)"
                addone = true
            } else {
                str += "\(value)"
                addone = false
            }
            i -= 1
            j -= 1
        }
        if addone {
            str += "1"
        }
        return String(str.reversed())
    }
}
