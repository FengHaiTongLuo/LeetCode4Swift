class Solution {
    func myAtoi(_ s: String) -> Int {
        let cString = s.cString(using: .utf8)!
        let length = strlen(cString);
        let charZero = ("0".cString(using: .utf8)!)[0]
        let charSpace = (" ".cString(using: .utf8)!)[0]
        let charNegative = ("-".cString(using: .utf8)!)[0]
        let charPositive = ("+".cString(using: .utf8)!)[0]
        var result = 0
        var startReadingNumber = false
        var negative = false

        for i in 0..<length {
            let char = cString[i]
            if !startReadingNumber && char == charSpace {
                continue
            }
            let number = Int(char - charZero)
            if number >= 0 && number <= 9 {
                startReadingNumber = true
                var value = result * 10 + number
                if !negative && value > Int32.max {
                    value = Int(Int32.max)
                }
                if negative && value - 1 > Int32.max {
                    value = Int(Int32.max)
                    value += 1
                }

                result = value
            } else if char == charNegative {
                if startReadingNumber {
                    break
                }
                negative = true
                startReadingNumber = true
            } else if char == charPositive {
                if startReadingNumber {
                    break
                }
                startReadingNumber = true
            } else {
                break
            }
        }

        if negative {
            result = -result
        }

        return result
    }
}
