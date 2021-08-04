class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var isColZero = false
        for i in 0..<matrix.count {
            guard matrix[i][0] != 0 else {
                isColZero = true
                break
            } 
        }
        for i in 0..<matrix[0].count {
            guard matrix[0][i] != 0 else {
                matrix[0][0] = 0
                break
            }
        }
        
        var i = 1
        while i < matrix.count {
            var j = 1
            while j < matrix[0].count {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
                j += 1
            }
            i += 1
        }

        i = 1
        while i < matrix.count {
            var j = 1
            while j < matrix[0].count {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
                j += 1
            }
            i += 1
        }

        if matrix[0][0] == 0 {
            for i in 0..<matrix[0].count {
                matrix[0][i] = 0
            }
        }

        if isColZero {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }

    }
}
