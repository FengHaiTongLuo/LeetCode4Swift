class Solution {
    enum Direction {
        case right, down, left, up
    }

    private let directions: [Direction] = [.right, .down, .left, .up]

    func moveNext(_ p: (Int, Int), _ direction: Direction) -> (Int, Int) {
        switch direction {
            case .right :
                return (p.0, p.1+1)
            case .down :
                return (p.0+1, p.1)
            case .left :
                return (p.0, p.1-1)
            case .up :
                return (p.0-1, p.1)
        }
    }

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rowCount = matrix.count
        let colCount = matrix[0].count
        var bounds: (right: Int, down: Int, left: Int, up: Int) = 
                    (colCount - 1, rowCount - 1, 0, 0)
        var directionIndex = 0
        var cursor: (Int, Int) = (0, 0)
        var output: [Int] = []

        func isOutOfBound(_ p: (Int, Int)) -> Bool {
            p.0 > bounds.down || p.0 < bounds.up ||
            p.1 > bounds.right || p.1 < bounds.left
        }

        while true {
            let number = matrix[cursor.0][cursor.1]
            output.append(number)
            var direction = directions[directionIndex]
            var nextMovement = moveNext(cursor, direction)
            if isOutOfBound(nextMovement) {
                directionIndex = (directionIndex + 1) % directions.count
                direction = directions[directionIndex]
                nextMovement = moveNext(cursor, direction)
                if isOutOfBound(nextMovement) {
                    break
                }
                switch direction {
                    case .down :
                        bounds.up += 1
                    case .left :
                        bounds.right -= 1
                    case .up :
                        bounds.down -= 1
                    case .right :
                        bounds.left += 1
                }
            }
            cursor = nextMovement
        }

        return output
    }
}
