class Solution {
    func cchar(_ s: String) -> CChar {
        return s.cString(using: .utf8)![0]
    }

    func romanToInt(_ s: String) -> Int {
        let r = s.cString(using: .utf8)!
        var c = strlen(r) - 1
        var total = 0
        var lastNumbe = 0
        let map: [CChar: Int] = [
            cchar("I"): 1, cchar("V"): 5,
            cchar("X"): 10, cchar("L"): 50,
            cchar("C"): 100, cchar("D"): 500,
            cchar("M"): 1000
        ]
        
        while c >= 0 {
            let char = r[c]
            let number = map[char]!
            if lastNumbe > number {
                total -= number
            } else {
                total += number
            }
            lastNumbe = number
            c -= 1
        }

        return total
    }
}

