class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var touch: [[Bool]] = Array(repeating: 
                                        Array(repeating: false, count: board[0].count),
                                    count: board.count)
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        let cs = word.cString(using: .ascii)!
        let len = strlen(cs)
        func search(_ loc: (Int, Int), _ index: Int) -> Bool {
            if index == len { return true }
            if loc.0 < 0 || loc.0 >= board.count || loc.1 < 0 || loc.1 >= board[0].count {
                return false
            }
            if touch[loc.0][loc.1] { return false }
            if cs[index] != board[loc.0][loc.1].asciiValue! { return false }
            touch[loc.0][loc.1] = true
            for dir in dirs {
                if search((loc.0+dir.0, loc.1+dir.1), index+1) {
                    return true
                }
            }
            touch[loc.0][loc.1] = false
            return false
        }
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if search((row, col), 0) {
                    return true
                }
            }
        }
        return false
    }
}
