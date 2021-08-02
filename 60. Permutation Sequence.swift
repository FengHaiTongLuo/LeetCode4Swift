class Solution {
    var nexCache: [Int] = Array(repeating: 0, count: 10)
    func nex(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard nexCache[n] == 0 else { return nexCache[n] }
        var val = 1
        var nn = n
        while nn >= 1 {
            val *= nn
            nn -= 1
        }
        nexCache[n] = val
        return val
    }

    func swap_sort(_ output: inout [Int], _ a: Int, _ b: Int) {
        guard a < b else { return }
        let temp = output[b]
        var i = b - 1
        while i >= a {
            output[i+1] = output[i]
            i -= 1
        }
        output[a] = temp
    }

    func search(_ output: inout [Int], _ index: Int, _ target: Int) {
        guard target > 1 else { return }
        let n = output.count - index
        let c = nex(n-1)
        let cn = (target - 1) / c
        swap_sort(&output, index, index + cn)
        search(&output, index + 1, target - cn * c)
    }

    func getPermutation(_ n: Int, _ k: Int) -> String {
        var output = Array(repeating: 0, count: n)
        for i in 0..<n {
            output[i] = i + 1
        }
        search(&output, 0, k)
        var str = ""
        for item in output {
            str += "\(item)"
        }
        return str
    }
}
