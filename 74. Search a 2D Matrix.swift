class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        func getNumber(_ i: Int) -> Int {
            let row = i / matrix[0].count
            let col = i % matrix[0].count
            return matrix[row][col]
        }

        var head = 0
        var tail = matrix.count * matrix[0].count - 1
        var center = (tail + head) / 2
        while head <= tail {
            let number = getNumber(center)
            if target > number {
                head = center + 1
                center = (tail + head) / 2
            } else if target < number {
                tail = center - 1
                center = (tail + head) / 2
            } else {
                return true
            }
        }

        return false
    }
}
