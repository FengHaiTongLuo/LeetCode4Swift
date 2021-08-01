class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let cString = s.cString(using: .utf8)!
        let length = strlen(cString)
        var newString: [CChar] = []
        var index = -1
        var down = true

        if length == 1 || numRows == 1 {
            return s
        }

        for row in 0..<numRows {
            while true {
                if index == -1 {
                    index = row
                } else {
                    var offset = 0
                    if down {
                        offset = (numRows - row - 1) * 2
                    } else {
                        offset = row * 2
                    }
                    down = !down
                    if offset == 0 {
                        continue
                    }
                    index += offset
                }
                if index >= length {
                    break
                }
                newString.append(cString[index])
            }
            index = -1
            down = true
        }

        return String(cString: newString + [0])
    }
}


