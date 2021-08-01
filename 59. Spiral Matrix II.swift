class Solution {
    enum Direction { case right, down, left, up }
    class State {
        var location: (col: Int, row: Int) = (0, 0)
        var direction: Direction = .right
        var next: (col: Int, row: Int) {
            var value = location
            switch direction {
                case .right :
                    value.col += 1
                case .down :
                    value.row += 1
                case .left :
                    value.col -= 1
                case .up :
                    value.row -= 1
            }
            return value
        }
        func turnDirection() {
            switch direction {
            case .right :
                direction = .down
            case .down :
                direction = .left
            case .left :
                direction = .up
            case .up :
                direction = .right
            }
        }
    }

    func generateMatrix(_ n: Int) -> [[Int]] {
        var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        let state = State()
        let count = n * n
        for number in 1...count {
            let location = state.location
            res[location.row][location.col] = number
            var next = state.next
            if next.col < 0 || next.col >= n || next.row < 0 || next.row >= n ||
               res[next.row][next.col] != 0 {
                state.turnDirection()
                next = state.next
            }
            state.location = next
        }
        return res
    }
}
